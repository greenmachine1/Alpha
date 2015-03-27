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
        return 10
    }
    
    
    // what to display for each cell //
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as CustomCollectionViewCell
        
        // creation of the cell view which includes the center circle //
        var newCell:CellCircleDraw = CellCircleDraw()
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

        if(row != 0){

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
        
        println("name \(InformationIntermediary.sharedInstance.eventName)")
        println("seconds \(InformationIntermediary.sharedInstance.timeInSeconds)")
        println("number and time of Repeats \(InformationIntermediary.sharedInstance.numberOfRepeats) \(InformationIntermediary.sharedInstance.timeInBetweenRepeatsInSeconds)")
        
        
        
    }
    


}


