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
        sideBarTableView.tableView.contentInset = UIEdgeInsetsMake(heightOfNavigationBar, 0.0, 0.0, 0.0)
        
        
        sideBarView.backgroundColor = UIColor.clearColor()
        //let blurView:UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
        //blurView.frame = sideBarView.bounds
        //sideBarView.addSubview(blurView)

        
        sideBarView.addSubview(sideBarTableView.tableView)
        
        // adding the side bar to the calling view //
        _view.addSubview(sideBarView)
    }
    
    
    // moving out the sidebar to make visible //
    func openSideBar(){
        
        sideBarView.frame = CGRectMake(0, _view.frame.origin.y + heightOfNavigationBar, widthOfSideBar, _view.frame.height)
        
    }
    
    
    // moving the sidebar back in //
    func closeSideBar(){
        
        sideBarView.frame = CGRectMake(_view.frame.origin.x - widthOfSideBar, _view.frame.origin.y + heightOfNavigationBar, widthOfSideBar, _view.frame.height)
        
    }
    
    
    // return from tableView selection //
    func returnOptionSelected(row: Int) {
        
        delegate?.returnSelected(row)
        
    }
    
    
    
}
