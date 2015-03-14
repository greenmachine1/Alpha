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
    
    
    
}
