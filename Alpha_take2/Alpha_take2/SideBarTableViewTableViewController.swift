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

class SideBarTableViewTableViewController: UITableViewController, UITextFieldDelegate {
    
    var NORMAL_SIZE_OF_CELL:CGFloat = 80.0
    var BLANK_SIZE_OF_CELL:CGFloat = 10.0
    var CORNER_RADIUS:CGFloat = 10.0
    
    var delegate:ReturnInformationFromSideBar?

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 9
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        // **** blank cell **** //
        var leftImage:UIImageView = UIImageView(image: UIImage(named: "Question_mark.png"))
        
        var blankCell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
        blankCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        blankCell!.backgroundColor = UIColor.clearColor()
        blankCell!.userInteractionEnabled = false
        

        
        
        // first cell -- enter name of event cell -- //
        if(indexPath.row == 0){
            
            
            
            var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
        
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
            cell!.backgroundColor = ColorPallete.sharedInstance.lightBlueColor
            cell!.layer.cornerRadius = CORNER_RADIUS
            cell!.clipsToBounds = true
            
            
            

            // creating the left icon image //
            leftImage.frame = CGRectMake(cell!.frame.origin.x + 5.0, cell!.frame.origin.y + 5.0, 70.0, 70.0)
            leftImage.layer.cornerRadius = CORNER_RADIUS
            leftImage.clipsToBounds = true
            
        
            
            // creating the textfield entry point //
            var userInputField:UITextField = UITextField(frame: CGRectMake(leftImage.frame.origin.x + (leftImage.frame.width + 10.0),
                (cell!.frame.origin.y + cell!.frame.height / 4) + 20.0, 200.0, 25.0))
            userInputField.backgroundColor = UIColor.whiteColor()
            userInputField.borderStyle = UITextBorderStyle.RoundedRect
            userInputField.layer.borderColor = ColorPallete.sharedInstance.darkGreenColor.CGColor
            userInputField.placeholder = "Enter event name here"
            userInputField.clearsOnBeginEditing = true
            
            userInputField.delegate = self
            
            
            
            // event name label //
            var nameOfEventLabel:UILabel = UILabel(frame: CGRectMake(userInputField.frame.origin.x, userInputField.frame.origin.y - 20.0, userInputField.frame.width, 20.0))
            nameOfEventLabel.textColor = ColorPallete.sharedInstance.whiteColor
            nameOfEventLabel.text = "Event name"

            
            
            cell?.addSubview(leftImage)
            cell?.addSubview(userInputField)
            cell?.addSubview(nameOfEventLabel)
            

            return cell!
            
        }else if(indexPath.row == 1){

            return blankCell!
            
            
        // second cell -- enter time event cell -- //
        }else if(indexPath.row == 2){
            
            var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
            
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
            cell!.backgroundColor = ColorPallete.sharedInstance.lightBlueColor
            cell!.layer.cornerRadius = 10.0
            cell!.clipsToBounds = true
            
            leftImage.frame = CGRectMake(cell!.frame.origin.x + 5.0, cell!.frame.origin.y + 5.0, 70.0, 70.0)
            leftImage.layer.cornerRadius = 10.0
            leftImage.clipsToBounds = true
            
            cell?.addSubview(leftImage)

            
            return cell!
            
            
        }else if(indexPath.row == 3){
            
            return blankCell!
            
            
            
        // third cell -- repeats time event cell -- //
        }else if(indexPath.row == 4){
            
            var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
            
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
            cell!.backgroundColor = ColorPallete.sharedInstance.lightBlueColor
            cell!.layer.cornerRadius = 10.0
            cell!.clipsToBounds = true
            
            leftImage.frame = CGRectMake(cell!.frame.origin.x + 5.0, cell!.frame.origin.y + 5.0, 70.0, 70.0)
            leftImage.layer.cornerRadius = 10.0
            leftImage.clipsToBounds = true
            
            cell?.addSubview(leftImage)

            
            return cell!
            
            
        }else if(indexPath.row == 5){
            
            return blankCell!
            
        
        // forth cell -- repeats detail event cell -- //
        }else if(indexPath.row == 6){
            
            var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
            
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
            cell!.backgroundColor = ColorPallete.sharedInstance.lightBlueColor
            cell!.layer.cornerRadius = 10.0
            cell!.clipsToBounds = true
            
            leftImage.frame = CGRectMake(cell!.frame.origin.x + 5.0, cell!.frame.origin.y + 5.0, 70.0, 70.0)
            leftImage.layer.cornerRadius = 10.0
            leftImage.clipsToBounds = true
            
            cell?.addSubview(leftImage)

            
            return cell!
            
            
        }else if(indexPath.row == 7){
            
            return blankCell!
            
            
        // fifth cell -- color scheme event cell -- //
        }else if(indexPath.row == 8){
            
            var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
            
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
            cell!.backgroundColor = ColorPallete.sharedInstance.lightBlueColor
            cell!.layer.cornerRadius = 10.0
            cell!.clipsToBounds = true
            
            leftImage.frame = CGRectMake(cell!.frame.origin.x + 5.0, cell!.frame.origin.y + 5.0, 70.0, 70.0)
            leftImage.layer.cornerRadius = 10.0
            leftImage.clipsToBounds = true
            
            cell?.addSubview(leftImage)

            
            return cell!
            
            
        }else{
            
            return blankCell!
            
        }
    }
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        delegate?.returnOptionSelected(indexPath.row)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if(indexPath.row == 0){
            return NORMAL_SIZE_OF_CELL
        }else if(indexPath.row == 1){
            return BLANK_SIZE_OF_CELL
        }else if(indexPath.row == 2){
            return NORMAL_SIZE_OF_CELL
        }else if(indexPath.row == 3){
            return BLANK_SIZE_OF_CELL
        }else if(indexPath.row == 4){
            return NORMAL_SIZE_OF_CELL
        }else if(indexPath.row == 5){
            return BLANK_SIZE_OF_CELL
        }else if(indexPath.row == 6){
            return NORMAL_SIZE_OF_CELL
        }else if(indexPath.row == 7){
            return BLANK_SIZE_OF_CELL
        }else if(indexPath.row == 8){
            return NORMAL_SIZE_OF_CELL
        }else{
            return BLANK_SIZE_OF_CELL
        }
        
    }
    
    
    // dismissing the keyboard //
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    


}
