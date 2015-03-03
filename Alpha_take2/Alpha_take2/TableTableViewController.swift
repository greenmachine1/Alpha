//
//  TableTableViewController.swift
//  Alpha_take2
//
//  Created by Cory Green on 3/1/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

class TableTableViewController: UITableViewController {

    @IBOutlet var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 5
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0){
            
            let cell = tableView.dequeueReusableCellWithIdentifier("standardCell", forIndexPath: indexPath) as CustomCellTableViewCell

            cell.mainLabel.text = "Name of Event!"

            return cell
            
        }else if(indexPath.row == 1){
            
            let cell = tableView.dequeueReusableCellWithIdentifier("standardCell", forIndexPath: indexPath) as CustomCellTableViewCell
            
            cell.mainLabel.text = "Time of Event"
            
            return cell
            
        }else if(indexPath.row == 2){
            
            let cell = tableView.dequeueReusableCellWithIdentifier("repeatsCell", forIndexPath: indexPath) as RepeatsCell
            
            return cell
            
        }else if(indexPath.row == 3){
            
            let cell = tableView.dequeueReusableCellWithIdentifier("standardCell", forIndexPath: indexPath) as CustomCellTableViewCell
            
            cell.mainLabel.text = "Time in Between Repeats"
            
            return cell
            
        }else{
            
            let cell = tableView.dequeueReusableCellWithIdentifier("colorSchemeCell", forIndexPath: indexPath) as ColorSchemeCell
            
            return cell
            
        }
        
    }
    



}
