//
//  TableTableViewController.swift
//  Alpha_take2
//
//  Created by Cory Green on 3/1/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

class TableTableViewController: UITableViewController, ReturnTimerInfo, ReturnEventName {

    @IBOutlet var mainTableView: UITableView!
    var color:ColorPallete = ColorPallete()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
    }


    
    // creating the labels for each cell //
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var label:UILabel = UILabel(frame: CGRectMake(0, 0, self.tableView.frame.width, 15.0))
        
        if(section == 0){
            label.text = "Name of Event"
        }else if(section == 1){
            label.text = "Timer"
        }else if(section == 2){
            label.text = "Number of Repeats"
        }else if(section == 3){
            label.text = "Time in between repeats"
        }else{
            label.text = "Color Scheme"
        }
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
        label.backgroundColor = color.lightBlueColor
        return label
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 5
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0){
            
            let cell = tableView.dequeueReusableCellWithIdentifier("standardCell", forIndexPath: indexPath) as CustomCellTableViewCell
            
            cell.delegate = self
            
            cell.mainLabel.textColor = color.darkGreenColor
            
            cell.mainLabel.text = "Name"
            
            return cell
            
        }else if(indexPath.section == 1){
            
            let cell = tableView.dequeueReusableCellWithIdentifier("timerCell", forIndexPath: indexPath) as TimerCell
            
            
            cell.mainLabel.textColor = color.darkGreenColor
            cell.mainLabel.text = "Time"
            
            return cell
            
        }else if(indexPath.section == 2){
            
            let cell = tableView.dequeueReusableCellWithIdentifier("repeatsCell", forIndexPath: indexPath) as RepeatsCell
            
            cell.mainLabel.textColor = color.darkGreenColor
            cell.mainLabel.text = "Repeats"
            
            return cell
            
        }else if(indexPath.section == 3){
            
            let cell = tableView.dequeueReusableCellWithIdentifier("timerCell", forIndexPath: indexPath) as TimerCell
            
            cell.mainLabel.textColor = color.darkGreenColor
            cell.mainLabel.text = "Time in Between Repeats"
            
            return cell
            
        }else{
            
            // color scheme cell //
            let cell = tableView.dequeueReusableCellWithIdentifier("colorSchemeCell", forIndexPath: indexPath) as ColorSchemeCell
            
            cell.mainLabel.textColor = color.darkGreenColor
            cell.mainLabel.text = "Colors"
            
            return cell
            
        }
    }
    
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        println("index selected \(indexPath.section)")
        
        
        if(indexPath.section == 1){
            
            var timerView = self.storyboard?.instantiateViewControllerWithIdentifier("Time") as TimerViewController
            
            timerView.delegate = self
        
            self.navigationController?.pushViewController(timerView, animated: true)
            
        }else if(indexPath.section == 2){
            
            var timerView = self.storyboard?.instantiateViewControllerWithIdentifier("Repeats") as RepeatsViewController
            
            self.navigationController?.pushViewController(timerView, animated: true)
            
        }
    }
    
    
    
    // return functions from the various cells //
    func returnEventName(nameOfEvent: String) {
        println("name of event \(nameOfEvent)")
    }
    
    
    func returnTime(#hour: Int, minutes: Int) {
        
        println("here! \(hour) minutes \(minutes)")
        
    }

}
