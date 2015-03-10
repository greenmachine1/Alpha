//
//  SideBarTableViewTableViewController.swift
//  Alpha_take2
//
//  Created by Cory Green on 3/9/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

@objc protocol ReturnInformationFromSideBar{
    
    func returnOptionSelected(row:Int)
    
}

class SideBarTableViewTableViewController: UITableViewController {
    
    var delegate:ReturnInformationFromSideBar?

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 5
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
        
        cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell!.backgroundColor = UIColor.clearColor()

        cell!.textLabel!.text = "Hello!"

        return cell!
    }
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        delegate?.returnOptionSelected(indexPath.row)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 80.0
        
    }
    


}
