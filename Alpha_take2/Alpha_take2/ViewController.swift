//
//  ViewController.swift
//  Alpha_take2
//
//  Created by Cory Green on 2/25/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ReturnInformationFromSideBarDelegate, UIPopoverPresentationControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate{
    
    var sidebar:SideBar = SideBar()
    var toggleSideBar:Bool = false
    
    
    var timerObjects:[TimerObject] = [TimerObject]()
    
    
    
    
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
        
        if(timerObjects.count != 0){
            return timerObjects.count
        }else{
            return 0
        }
    }
    
    
    // what to display for each cell //
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as CustomCollectionViewCell
        
        // creation of the cell view which includes the center circle //
        var newCell:CellCircleDraw = CellCircleDraw()
        
        // setting the data for the cell //
        newCell._normalColor = timerObjects[indexPath.row]._firstColor
        newCell._midPointColor = timerObjects[indexPath.row]._secondColor
        newCell._threeForthsDoneColor = timerObjects[indexPath.row]._thirdColor
        newCell._nameOfEvent = timerObjects[indexPath.row]._name
        newCell._numberOfRepeats = timerObjects[indexPath.row]._numberOfTimesInBetweenTimer
        newCell._timeInBetweenRepeats = timerObjects[indexPath.row]._timeInBetweenTimers
        
        
        newCell.initialize(cell.cellUIView, nameOfEvent:"____")
        
        
        
        return cell
    }
    
    
    
    // selecting a collection view cell //
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        
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
        
        var newTimerObject:TimerObject = TimerObject()
        
        // setting up the new timer object options //
        newTimerObject._name = InformationIntermediary.sharedInstance.eventName
        newTimerObject._timeInSeconds = InformationIntermediary.sharedInstance.timeInSeconds
        newTimerObject._countUpOrDown = InformationIntermediary.sharedInstance.countDownOrUpBool
        newTimerObject._timeInBetweenTimers = InformationIntermediary.sharedInstance.timeInBetweenRepeatsInSeconds
        newTimerObject._numberOfTimesInBetweenTimer = InformationIntermediary.sharedInstance.numberOfRepeats
        newTimerObject._firstColor = InformationIntermediary.sharedInstance.leftColor
        newTimerObject._secondColor = InformationIntermediary.sharedInstance.centerColor
        newTimerObject._thirdColor = InformationIntermediary.sharedInstance.rightColor
        
        
        timerObjects.append(newTimerObject)
        mainCollectionView.reloadData()
        
        
        
        
    }
    


}


