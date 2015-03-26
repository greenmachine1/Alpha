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
    func doneButtonSelected()
    
}

class SideBarTableViewTableViewController: UITableViewController, UITextFieldDelegate, UIAlertViewDelegate {
    
    var NORMAL_SIZE_OF_CELL:CGFloat = 80.0
    var SIZE_OF_IMAGES:CGFloat = 70.0
    var BLANK_SIZE_OF_CELL:CGFloat = 5.0
    var CORNER_RADIUS:CGFloat = 10.0
    var mainView:UIView = UIView()
    
    var userInputField:UITextField?
    
    
    
    
    // **** variables that can be set by the ouside **** //
    var _literalTimeString:String = "00:00:00"
    
    // by default, countDownOrUp is set to true which means its a count down timer //
    var countDownOrUp:Bool = true
    
    var eventName:String = ""
    
    var repeatTimerOptionsString:String = "Repeats Options"
    
    var _leftColorScheme:UIColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    var _centerColorScheme:UIColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
    var _rightColorScheme:UIColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
    
    
    // **** ---- **** //
    
    
    
    
    
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
        
        if(mainView.frame.height == 480){
            SIZE_OF_IMAGES = 60
        }else{
            SIZE_OF_IMAGES = 70
        }
        

        
        
        // first cell -- enter name of event cell -- //
        if(indexPath.row == 0){
            
            var leftImage:UIImageView = UIImageView(image: UIImage(named: "color_icon.png"))
            
            
            var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
        
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
            cell!.backgroundColor = ColorPallete.sharedInstance.whiteColor
            cell!.layer.cornerRadius = CORNER_RADIUS
            cell!.clipsToBounds = true
            cell!.selectionStyle = .None
            cell!.layer.borderColor = ColorPallete.sharedInstance.deepBlueColor.CGColor
            cell!.layer.borderWidth = 1.0
            
            
            

            // creating the left icon image //
            leftImage.frame = CGRectMake(cell!.frame.origin.x + 5.0, cell!.frame.origin.y + 5.0, SIZE_OF_IMAGES, SIZE_OF_IMAGES)
            leftImage.layer.cornerRadius = CORNER_RADIUS
            leftImage.clipsToBounds = true
            
        
            
            // creating the textfield entry point //
            userInputField = UITextField(frame: CGRectMake(leftImage.frame.origin.x + (leftImage.frame.width + 10.0),
                (cell!.frame.origin.y + cell!.frame.height / 4) + 15.0, 200.0, 30.0))

            userInputField!.backgroundColor = UIColor.whiteColor()
            userInputField!.borderStyle = UITextBorderStyle.RoundedRect
            userInputField!.layer.borderColor = ColorPallete.sharedInstance.deepBlueColor.CGColor
            userInputField!.layer.borderWidth = 1.0
            userInputField!.layer.cornerRadius = 10.0
            userInputField!.clipsToBounds = true
            userInputField!.placeholder = "Optional"
            userInputField!.text = eventName
            userInputField!.clearsOnBeginEditing = true
            
            userInputField!.delegate = self
            
            
            
            // event name label //
            var nameOfEventLabel:UILabel = UILabel(frame: CGRectMake(userInputField!.frame.origin.x, userInputField!.frame.origin.y - 22.0, userInputField!.frame.width, 20.0))
            nameOfEventLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
            nameOfEventLabel.text = "Set Event name"
            nameOfEventLabel.textAlignment = .Center

            
            
            cell?.addSubview(leftImage)
            cell?.addSubview(userInputField!)
            cell?.addSubview(nameOfEventLabel)
            

            return cell!
            
        }else if(indexPath.row == 1){

            return blankCell!
            
            
        // second cell -- enter time event cell -- //
        }else if(indexPath.row == 2){
            
            var countUpOrDownString = ""
            if(countDownOrUp == true){
                countUpOrDownString = "DN"
            }else{
                countUpOrDownString = "UP"
            }
            
            var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
            
            var leftImage:UIImageView = UIImageView(image: UIImage(named: "timer_icon.png"))
            
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
            cell!.backgroundColor = ColorPallete.sharedInstance.whiteColor
            cell!.layer.cornerRadius = 10.0
            cell!.clipsToBounds = true
            cell!.selectionStyle = UITableViewCellSelectionStyle.None
            cell!.layer.borderColor = ColorPallete.sharedInstance.deepBlueColor.CGColor
            cell!.layer.borderWidth = 1.0
            
            leftImage.frame = CGRectMake(cell!.frame.origin.x + 5.0, cell!.frame.origin.y + 5.0, SIZE_OF_IMAGES, SIZE_OF_IMAGES)
            leftImage.layer.cornerRadius = 10.0
            leftImage.clipsToBounds = true
            
            
            
            
            // the main timer label -- will get populated with the users selected time info //
            var timerInfoLabel:UILabel = UILabel(frame: CGRectMake(leftImage.frame.origin.x + (leftImage.frame.width + 10.0), (cell!.frame.origin.y + cell!.frame.height / 4) + 10.0, 200.0, 40.0))
            
            timerInfoLabel.text = "\(_literalTimeString) \(countUpOrDownString)"
            timerInfoLabel.font = UIFont(name: "Courier", size: 30.0)
            timerInfoLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
            timerInfoLabel.textAlignment = .Center

            
            // set timer label //
            var timerLabel:UILabel = UILabel(frame: CGRectMake(timerInfoLabel.frame.origin.x, timerInfoLabel.frame.origin.y - 20.0, timerInfoLabel.frame.width, 20.0))
            timerLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
            timerLabel.text = "Set Timer"
            timerLabel.textAlignment = .Center
            
            
            cell?.addSubview(leftImage)
            cell?.addSubview(timerInfoLabel)
            cell?.addSubview(timerLabel)
            
            return cell!
            
            
        }else if(indexPath.row == 3){
            
            return blankCell!
            
            
            
        // third cell -- repeats time event cell -- //
        }else if(indexPath.row == 4){
            
            var leftImage:UIImageView = UIImageView(image: UIImage(named: "repeats_icon.png"))
            
            var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
            
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
            cell!.backgroundColor = ColorPallete.sharedInstance.whiteColor
            cell!.layer.cornerRadius = 10.0
            cell!.clipsToBounds = true
            cell!.selectionStyle = UITableViewCellSelectionStyle.None
            cell!.layer.borderColor = ColorPallete.sharedInstance.deepBlueColor.CGColor
            cell!.layer.borderWidth = 1.0
            
            leftImage.frame = CGRectMake(cell!.frame.origin.x + 5.0, cell!.frame.origin.y + 5.0, SIZE_OF_IMAGES, SIZE_OF_IMAGES)
            leftImage.layer.cornerRadius = 10.0
            leftImage.clipsToBounds = true
            
            
            
            var repeatsInfo:UILabel = UILabel(frame: CGRectMake((leftImage.frame.origin.x + leftImage.frame.width) + 10.0, (cell!.frame.origin.y + cell!.frame.height / 4) + 10.0, 140.0, 40.0))
            
            repeatsInfo.text = repeatTimerOptionsString
            repeatsInfo.textAlignment = .Center
            repeatsInfo.textColor = ColorPallete.sharedInstance.deepBlueColor
            repeatsInfo.font = UIFont(name: "Courier", size: 15.0)
            

            
            
            
            
            var turnOnAndOffRepeatsSwitch:UISwitch = UISwitch(frame: CGRectMake(cell!.frame.width - 80.0, repeatsInfo.frame.origin.y + 20.0, 20.0, 20.0))
            
            var repeatsTitle:UILabel = UILabel(frame: CGRectMake(repeatsInfo.frame.origin.x,repeatsInfo.frame.origin.y - 20.0, repeatsInfo.frame.size.width + turnOnAndOffRepeatsSwitch.frame.width + 10.0, 20.0))
            repeatsTitle.text = "Set Repeat Options"
            repeatsTitle.textColor = ColorPallete.sharedInstance.deepBlueColor
            repeatsTitle.textAlignment = .Center
            
            

            cell?.addSubview(leftImage)
            cell?.addSubview(repeatsInfo)
            cell?.addSubview(repeatsTitle)
            cell?.addSubview(turnOnAndOffRepeatsSwitch)
            
            return cell!
            
            
        }else if(indexPath.row == 5){
            
            return blankCell!
            
        
        // forth cell -- Color Scheme event cell -- //
        }else if(indexPath.row == 6){
            
            var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
            
            var leftImage:UIImageView = UIImageView(image: UIImage(named: "color_icon.png"))
            
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
            cell!.backgroundColor = ColorPallete.sharedInstance.whiteColor
            cell!.layer.cornerRadius = 10.0
            cell!.clipsToBounds = true
            cell!.selectionStyle = UITableViewCellSelectionStyle.None
            cell!.layer.borderColor = ColorPallete.sharedInstance.deepBlueColor.CGColor
            cell!.layer.borderWidth = 1.0
            
            leftImage.frame = CGRectMake(cell!.frame.origin.x + 5.0, cell!.frame.origin.y + 5.0, SIZE_OF_IMAGES, SIZE_OF_IMAGES)
            leftImage.layer.cornerRadius = 10.0
            leftImage.clipsToBounds = true
            
            
            
            
            
            // sets of colors //
            var leftMostColor:UIView = UIView(frame: CGRectMake((leftImage.frame.origin.x + leftImage.frame.width) + 10, (cell!.frame.origin.y + leftImage.frame.height) - 20.0, (cell!.frame.width - (leftImage.frame.origin.x + leftImage.frame.width) - 40.0) / 3, leftImage.frame.height / 3))
            
            leftMostColor.backgroundColor = _leftColorScheme
            leftMostColor.layer.cornerRadius = 5.0
            leftMostColor.clipsToBounds = true
            leftMostColor.layer.borderColor = ColorPallete.sharedInstance.deepBlueColor.CGColor
            leftMostColor.layer.borderWidth = 1.0
            
            var centerColor:UIView = UIView(frame: CGRectMake(leftMostColor.frame.origin.x + leftMostColor.frame.width, leftMostColor.frame.origin.y, leftMostColor.frame.width, leftMostColor.frame.height))
            
            centerColor.backgroundColor = _centerColorScheme
            centerColor.layer.cornerRadius = 5.0
            centerColor.clipsToBounds = true
            centerColor.layer.borderColor = ColorPallete.sharedInstance.deepBlueColor.CGColor
            centerColor.layer.borderWidth = 1.0
            
            var rightMostColor:UIView = UIView(frame: CGRectMake(centerColor.frame.origin.x + centerColor.frame.width, centerColor.frame.origin.y, centerColor.frame.width, centerColor.frame.height))
            
            rightMostColor.backgroundColor = _rightColorScheme
            rightMostColor.layer.cornerRadius = 5.0
            rightMostColor.clipsToBounds = true
            rightMostColor.layer.borderColor = ColorPallete.sharedInstance.deepBlueColor.CGColor
            rightMostColor.layer.borderWidth = 1.0
            
            var colorSchemeLabel:UILabel = UILabel(frame: CGRectMake(leftMostColor.frame.origin.x, leftImage.frame.origin.y, 200.0, 30.0))
            colorSchemeLabel.text = "Set Color Scheme"
            colorSchemeLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
            colorSchemeLabel.textAlignment = .Center
            
            
            
            
            
            
            cell?.addSubview(leftImage)
            cell?.addSubview(leftMostColor)
            cell?.addSubview(centerColor)
            cell?.addSubview(rightMostColor)
            cell?.addSubview(colorSchemeLabel)

            
            return cell!
            
            
        }else if(indexPath.row == 7){
            
            return blankCell!
            
            
        // fifth cell -- Done Cell -- //
        }else if(indexPath.row == 8){
            
            var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
            
            var leftImage:UIImageView = UIImageView(image: UIImage(named: "done_icon.png"))
            
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
            cell!.backgroundColor = ColorPallete.sharedInstance.whiteColor
            cell!.layer.cornerRadius = 10.0
            cell!.clipsToBounds = true
            cell!.selectionStyle = UITableViewCellSelectionStyle.None
            cell!.layer.borderColor = ColorPallete.sharedInstance.deepBlueColor.CGColor
            cell!.layer.borderWidth = 1.0
            
            leftImage.frame = CGRectMake(cell!.frame.origin.x + 5.0, cell!.frame.origin.y + 5.0, SIZE_OF_IMAGES, SIZE_OF_IMAGES)
            leftImage.layer.cornerRadius = 10.0
            leftImage.clipsToBounds = true
            
            
            var doneButton:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
            doneButton.frame = CGRectMake((leftImage.frame.origin.x + leftImage.frame.width) + 10.0, leftImage.frame.origin.y + cell!.frame.height / 2, 200.0, 40.0)
            
            doneButton.setTitle("Done", forState: UIControlState.Normal)
            doneButton.setTitleColor(ColorPallete.sharedInstance.deepBlueColor, forState: UIControlState.Normal)
            doneButton.backgroundColor = UIColor.clearColor()
            doneButton.layer.cornerRadius = 10.0
            doneButton.clipsToBounds = true
            doneButton.layer.borderColor = ColorPallete.sharedInstance.deepBlueColor.CGColor
            doneButton.layer.borderWidth = 1.0
            
            doneButton.addTarget(self, action: "doneWithTimerSelected:", forControlEvents: UIControlEvents.TouchUpInside)
            
            
            var doneLabel:UILabel = UILabel(frame: CGRectMake(doneButton.frame.origin.x, doneButton.frame.origin.y - 20.0, doneButton.frame.width, cell!.frame.height / 3))
            doneLabel.text = "Go!"
            doneLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
            doneLabel.textAlignment = .Center
            
            
            cell?.addSubview(leftImage)
            cell?.addSubview(doneButton)
            cell?.addSubview(doneLabel)

            
            return cell!
            
            
        }else{
            
            return blankCell!
            
        }
    }
    
    func doneWithTimerSelected(sender:UIButton){
        
        var doneButtonAlert:UIAlertView = UIAlertView(title: "Set Timer?", message: "Do you wish to set this timer?", delegate: self, cancelButtonTitle: "Ok", otherButtonTitles: "Cancel")
        doneButtonAlert.show()
    }
    
    
    
    
    // alert view pop up //
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if(buttonIndex == 0){
            
            delegate?.doneButtonSelected()
        }
    }
    
    
    // selected row //
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        delegate?.returnOptionSelected(indexPath.row)
    
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var heightOfContainerView = mainView.frame.size.height
        
        if(heightOfContainerView == 480){
            NORMAL_SIZE_OF_CELL = 70
        }else{
            NORMAL_SIZE_OF_CELL = 80
        }
        
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
        
        
        // seeing if the text field is left blank, if not then set the event name given by //
        // the user .  If the text field is blank, we need to give the event a number for //
        // the name of the event. //
        if(textField.text == ""){
            
        }else{
            
            
            InformationIntermediary.sharedInstance.eventName = userInputField!.text
            
            println("\(InformationIntermediary.sharedInstance.eventName)")
            
        }

        
        return true
    }
    
    


    


}
