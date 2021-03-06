//
//  SideBar.swift
//  Alpha_take2
//
//  Created by Cory Green on 3/9/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

@objc protocol ReturnInformationFromSideBarDelegate{
    
    func returnSelected(row:Int)
    func doneButtonPressedInSideView()
    
}

class SideBar: NSObject, ReturnInformationFromSideBar{
    
    var _view:UIView = UIView()
    var sideBarView:UIView = UIView()
    var sideBarTableView:SideBarTableViewTableViewController = SideBarTableViewTableViewController()
    
    var widthOfSideBar:CGFloat = 300.0
    var heightOfNavigationBar:CGFloat = 0.0
    var delegate:ReturnInformationFromSideBarDelegate?
   
    override init() {
        super.init()
    }
    
    init(view:UIView, navBarHeight:CGFloat) {
        super.init()
        
        
        // gets notified that data has changed from the sidebar and that it needs to be updated //
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateSideBar:", name: "dataChange", object: nil)
        
        


        _view = view
        heightOfNavigationBar = navBarHeight
        
        // upon instantiating , set the view to be off to the left side //
        sideBarView.frame = CGRectMake(_view.frame.origin.x - widthOfSideBar, _view.frame.origin.y + heightOfNavigationBar, widthOfSideBar, _view.frame.height)
        
        
        sideBarTableView.delegate = self
        sideBarTableView.tableView.frame = sideBarView.bounds
        sideBarTableView.tableView.clipsToBounds = false
        sideBarTableView.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        sideBarTableView.tableView.backgroundColor = UIColor.clearColor()
        
        sideBarTableView.tableView.scrollsToTop = false
        sideBarTableView.tableView.scrollEnabled = false
        sideBarTableView.tableView.contentInset = UIEdgeInsetsMake(heightOfNavigationBar, 0.0, 0.0, 0.0)
        sideBarView.backgroundColor = UIColor.clearColor()
        
        
        sideBarTableView.mainView = _view
        sideBarView.addSubview(sideBarTableView.tableView)
        
        // adding the side bar to the calling view //
        _view.addSubview(sideBarView)
    }
    
    
    // moving out the sidebar to make visible //
    func openSideBar(){
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.sideBarView.frame = CGRectMake(0, self._view.frame.origin.y + self.heightOfNavigationBar, self.widthOfSideBar, self._view.frame.height)
        })
        
        
        
    }
    
    
    // moving the sidebar back in //
    func closeSideBar(){
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.sideBarView.frame = CGRectMake(self._view.frame.origin.x - self.widthOfSideBar, self._view.frame.origin.y + self.heightOfNavigationBar, self.widthOfSideBar, self._view.frame.height)
        })
        
        
    }
    
    
    // return from tableView selection //
    func returnOptionSelected(row: Int) {
        
        delegate?.returnSelected(row)
        
    }
    
    
    // the major done button was selected in the sidebar and needs to close //
    func doneButtonSelected() {
        
        self.closeSideBar()
        delegate?.doneButtonPressedInSideView()
        
        
        // deleting the data afterwards //
        InformationIntermediary.sharedInstance.deleteData()
        
        // reloading the side bar with blank data //
        sideBarTableView._literalTimeString = InformationIntermediary.sharedInstance.literalTimeString
        sideBarTableView.countDownOrUp = InformationIntermediary.sharedInstance.countDownOrUpBool
        sideBarTableView.repeatTimerOptionsString = InformationIntermediary.sharedInstance.timeInBetweenRepeatsLiteralString
        sideBarTableView._leftColorScheme = InformationIntermediary.sharedInstance.leftColor
        sideBarTableView._centerColorScheme = InformationIntermediary.sharedInstance.centerColor
        sideBarTableView._rightColorScheme = InformationIntermediary.sharedInstance.rightColor
        

        
        
        sideBarTableView.tableView.reloadData()
    }
    
    
    
    
    // this is the observer that gets called when the user updates info and gets put //
    // into the singleton data class //
    func updateSideBar(sender:AnyObject){
        
        sideBarTableView._literalTimeString = InformationIntermediary.sharedInstance.literalTimeString
        sideBarTableView.countDownOrUp = InformationIntermediary.sharedInstance.countDownOrUpBool
        sideBarTableView.repeatTimerOptionsString = InformationIntermediary.sharedInstance.timeInBetweenRepeatsLiteralString
        
        // setting the colors //
        sideBarTableView._leftColorScheme = InformationIntermediary.sharedInstance.leftColor
        sideBarTableView._centerColorScheme = InformationIntermediary.sharedInstance.centerColor
        sideBarTableView._rightColorScheme = InformationIntermediary.sharedInstance.rightColor
        
        
        // reloading the table view //
        sideBarTableView.tableView.reloadData()
        
    }
}
