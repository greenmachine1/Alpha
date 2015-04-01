//
//  ViewController.swift
//  Alpha_take2
//
//  Created by Cory Green on 2/25/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ReturnInformationFromSideBarDelegate, UIPopoverPresentationControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate, ReturnTimerDelegate, UIAlertViewDelegate{
    
    var sidebar:SideBar = SideBar()
    var toggleSideBar:Bool = false


    var arrayOfTimerObjects:[TimerObject] = [TimerObject]()

    var dictionaryOfTimerObjects:[String:String] = [String:String]()
    var arrayOfEventNames:[String] = [String]()
    
    var rowClickedOnInCollectionView:Int = 0
    
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // navigation left button //
        var addNewTimerButton:UIBarButtonItem = UIBarButtonItem(title: "Add New Timer", style: UIBarButtonItemStyle.Done, target: self, action: "addNewTimer")
        
        self.navigationItem.leftBarButtonItem = addNewTimerButton
        
        
        // creating the sidebar //
        sidebar = SideBar(view: self.view, navBarHeight: self.navigationController!.navigationBar.frame.height)
        
        sidebar.delegate = self
        mainCollectionView.delegate = self
        
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrayOfEventNames.count
    }
    
    
    // what to display for each cell //
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as CustomCollectionViewCell
        
        
        cell.backgroundColor = UIColor.clearColor()
        cell.layer.cornerRadius = 10.0
        cell.clipsToBounds = true
        cell.layer.borderColor = ColorPallete.sharedInstance.deepBlueColor.CGColor
        cell.layer.borderWidth = 1.0
        
        cell.nameLabel.text = arrayOfEventNames[indexPath.row]
        cell.timeLabel.text = dictionaryOfTimerObjects[arrayOfEventNames[indexPath.row]]
        

        return cell
    }
    
    
    
    // selecting a collection view cell //
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        var alertUser:UIAlertView = UIAlertView(title: "Event \(arrayOfEventNames[indexPath.row])", message: "What do you wish to do?", delegate: self, cancelButtonTitle: "Stop", otherButtonTitles: "Resume", "Delete")
        
        rowClickedOnInCollectionView = indexPath.row
        
        alertUser.delegate = self
        alertUser.show()
    }
    
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        println("button clicked = \(buttonIndex)")
        println("clicked on row \(rowClickedOnInCollectionView)")
        
        
        if(buttonIndex == 0){
            
            println("Stop")
            
            // stopping the timer //
            arrayOfTimerObjects[rowClickedOnInCollectionView].stopTimer()
            
        }else if(buttonIndex == 1){
            
            println("Resume")
            arrayOfTimerObjects[rowClickedOnInCollectionView].startTimer()
            
        }else if(buttonIndex == 2){
            
            println("Delete")
            
            arrayOfTimerObjects[rowClickedOnInCollectionView].stopTimer()
            
            
            dictionaryOfTimerObjects.removeValueForKey(arrayOfEventNames[rowClickedOnInCollectionView])
            arrayOfTimerObjects.removeAtIndex(rowClickedOnInCollectionView)
            arrayOfEventNames.removeAtIndex(rowClickedOnInCollectionView)
            
            mainCollectionView.reloadData()
        }
        
    }
    
    
    
    
    // opens and closes the side bar for setting timer options //
    func addNewTimer(){
        
        // make the side bar come out!
        if(toggleSideBar == false){
            
            sidebar.openSideBar()
            toggleSideBar = true
            self.navigationItem.leftBarButtonItem?.title = "Cancel"
            
            
        }else if(toggleSideBar == true){
            
            sidebar.closeSideBar()
            toggleSideBar = false
            self.navigationItem.leftBarButtonItem?.title = "Add New Timer"
            
        }
    }
    
    
    // showin a pop up view //
    func returnSelected(row: Int) {
        
        if(row != 0 && row != 8){

            var newPopUpView:popUpUI = popUpUI()
            newPopUpView.redrawView(self.view, rowSelected:row)
            newPopUpView.moveViewUp()
            
        }
    }
    
    
    
    // the done button has been pressed in the sidebar //
    // the actual setting of the timer will happen here. //
    func doneButtonPressedInSideView() {

        toggleSideBar = false
        self.navigationItem.leftBarButtonItem?.title = "Add New Timer"
        
        
        
        var newTimer:TimerObject = TimerObject()
        newTimer._name = InformationIntermediary.sharedInstance.eventName
        newTimer._time = InformationIntermediary.sharedInstance.timeInSeconds
        
        arrayOfEventNames.append(newTimer._name)
        arrayOfTimerObjects.append(newTimer)
        
        newTimer.delegate = self
        
        newTimer.startTimer()

        self.mainCollectionView.reloadData()
        
    
    }
    
    
    
    
    func returnTimeAndName(name: String, time: String) {
        
        dictionaryOfTimerObjects.updateValue(time, forKey: name)
        
        mainCollectionView.reloadData()
        
    }
    


}


