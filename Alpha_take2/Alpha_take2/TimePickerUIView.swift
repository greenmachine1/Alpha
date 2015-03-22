//
//  TimePickerUIView.swift
//  Alpha_take2
//
//  Created by Cory Green on 3/13/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

@objc protocol ReturnInfoDelegate{
    
    func doneButtonClick()
    func returnTimerWithInfo(totalTimeInseconds:Int, countUpOrDown:Bool)
    
    // ** this is for display purposes in the sidebar table view //
    func returnLiteralTime(hours:Int, minutes:Int, seconds:Int)
    
}

class TimePickerUIView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {

    var _callingView:UIView?
    var timerPickerView:UIPickerView = UIPickerView()
    
    var delegate:ReturnInfoDelegate?
    
    var hours:Int = 0
    var minutes:Int = 0
    var seconds:Int = 0
    
    var defaultTimerOptions = ["Zero","10 Sec","30 Sec","1 Min","5 Min","10 Min","15 Min", "20 Min", "30 Min", "45 Min", "1 Hour", "2 Hours", "5 Hours", "8 Hours", "12 Hours", "24 Hours"]
    
    // literal meaning in seconds of the default settings //
    var literalMeaningOfDefaultTimerOptions = [0,10,30,60,300,600,900,1200,1800,2700,3600,7200,18000,28800,43200, 86400]
    
    var finalValueForDefault:Int = 0
    var defaultValueStringForm = "00:00:00"
    
    var defaultOrCustomTimerToggleBool:Bool = true
    
    // the count up or count down bool is default set to true for being //
    // count down //
    var countUpOrCountDownBool:Bool = true
    
    var hoursLabel:UILabel?
    var minutesLabel:UILabel?
    var secondsLabel:UILabel?
    
    
    
    
    
    func drawPickerView(callingView:UIView){
        
        _callingView = callingView
        
        self.frame = _callingView!.bounds
        
        var timerLabel:UILabel = UILabel(frame: CGRectMake(self.frame.origin.x + 20.0, self.frame.origin.y + 20.0, self.frame.width - 40.0, 20.0))
        timerLabel.text = "Set Timer"
        timerLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
        timerLabel.textAlignment = .Center
        
        
        // done button //
        var doneButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        doneButton.frame = CGRectMake(self.frame.origin.x + 20.0, self.frame.height - 60.0, self.frame.width - 40.0, 40.0)
        doneButton.backgroundColor = UIColor.clearColor()
        doneButton.setTitle("Done", forState: UIControlState.Normal)
        doneButton.setTitleColor(ColorPallete.sharedInstance.deepBlueColor , forState: UIControlState.Normal)
        doneButton.addTarget(self, action: "doneButtonOnClick", forControlEvents: UIControlEvents.TouchUpInside)
        doneButton.layer.cornerRadius = 10.0
        doneButton.layer.borderColor = ColorPallete.sharedInstance.deepBlueColor.CGColor
        doneButton.layer.borderWidth = 1.0
        doneButton.clipsToBounds = true
        
        
        
        
        
        
        
        // timer picker view //
        timerPickerView.frame = CGRectMake((self.frame.width / 2) - (timerPickerView.frame.width / 2) + 40.0, (self.frame.height / 2) - (timerPickerView.frame.height / 2), self.frame.width - 40.0, 162.0)

        timerPickerView.delegate = self
        timerPickerView.backgroundColor = UIColor.clearColor()
        timerPickerView.layer.cornerRadius = 10.0
        timerPickerView.layer.borderColor = ColorPallete.sharedInstance.deepBlueColor.CGColor
        timerPickerView.layer.borderWidth = 1.0
    
        
        
        // timer labels //
        hoursLabel = UILabel(frame: CGRectMake(self.frame.origin.x + 20.0, timerPickerView.frame.origin.y - 20.0, timerPickerView.frame.width / 3, 20.0))
        hoursLabel!.text = "Hrs"
        hoursLabel!.textColor = ColorPallete.sharedInstance.deepBlueColor
        hoursLabel!.textAlignment = .Center
        
        minutesLabel = UILabel(frame: CGRectMake(hoursLabel!.frame.origin.x + hoursLabel!.frame.width, timerPickerView.frame.origin.y - 20.0, timerPickerView.frame.width / 3, 20.0))
        minutesLabel!.text = "Min"
        minutesLabel!.textColor = ColorPallete.sharedInstance.deepBlueColor
        minutesLabel!.textAlignment = .Center
        
        secondsLabel = UILabel(frame: CGRectMake(minutesLabel!.frame.origin.x + minutesLabel!.frame.width, timerPickerView.frame.origin.y - 20.0, timerPickerView.frame.width / 3, 20.0))
        secondsLabel!.text = "Sec"
        secondsLabel!.textColor = ColorPallete.sharedInstance.deepBlueColor
        secondsLabel!.textAlignment = .Center
        
        
        
        
        
        // hidding the hours and seconds labels because the default //
        // settings for the picker view are default times and therfor //
        // should only show the middle label //
        hoursLabel?.hidden = true
        secondsLabel?.hidden = true
        
        
        minutesLabel!.frame = CGRectMake(timerPickerView.frame.origin.x, timerPickerView.frame.origin.y - 20.0, timerPickerView.frame.width, 20.0)
        minutesLabel!.text = "Default Times"
        
        
        
        
        
        // default segment control and count up or down segment controls //
        // their position will be dependant on the space between the //
        // time picker view and the done button //
        var spaceInBetweenPickerViewAndDoneButton = doneButton.frame.origin.y - (timerPickerView.frame.origin.y + timerPickerView.frame.height)
        
        var spaceForEach = (spaceInBetweenPickerViewAndDoneButton / 3) - 15.0
        var segmentControlheight:CGFloat = 20.0
        
        if(spaceForEach > 20.0){
            segmentControlheight = 30.0
        }

        var defaultTimesSegmentControl:UISegmentedControl = UISegmentedControl(items: ["Default Times", "Custom Times"])
        defaultTimesSegmentControl.frame = CGRectMake(timerPickerView.frame.origin.x, timerPickerView.frame.origin.y + timerPickerView.frame.height + spaceForEach, timerPickerView.frame.width, segmentControlheight)
        defaultTimesSegmentControl.selectedSegmentIndex = 0
        defaultTimesSegmentControl.addTarget(self, action: "defaultTimeChange:", forControlEvents: UIControlEvents.ValueChanged)
        defaultTimesSegmentControl.layer.backgroundColor = ColorPallete.sharedInstance.lightBlueColor.CGColor
        defaultTimesSegmentControl.layer.cornerRadius = 5.0
        defaultTimesSegmentControl.clipsToBounds = true
        
        
        
        
        
        
        
        var countUpOrDownSegmentControl:UISegmentedControl = UISegmentedControl(items: ["Count up", "Count down"])
        countUpOrDownSegmentControl.frame = CGRectMake(defaultTimesSegmentControl.frame.origin.x, defaultTimesSegmentControl.frame.origin.y + defaultTimesSegmentControl.frame.height + spaceForEach, defaultTimesSegmentControl.frame.width, segmentControlheight)
        countUpOrDownSegmentControl.selectedSegmentIndex = 1
        countUpOrDownSegmentControl.addTarget(self, action: "countUpValueChange:", forControlEvents: UIControlEvents.ValueChanged)
        countUpOrDownSegmentControl.layer.backgroundColor = ColorPallete.sharedInstance.lightBlueColor.CGColor
        countUpOrDownSegmentControl.layer.cornerRadius = 5.0
        countUpOrDownSegmentControl.clipsToBounds = true
        

        self.addSubview(timerLabel)
        self.addSubview(timerPickerView)
        self.addSubview(hoursLabel!)
        self.addSubview(minutesLabel!)
        self.addSubview(secondsLabel!)
        self.addSubview(defaultTimesSegmentControl)
        self.addSubview(countUpOrDownSegmentControl)
        
        self.addSubview(doneButton)
    }
    
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60.0
    }
    
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView {
        
        if(defaultOrCustomTimerToggleBool == true){
            
            var mainLabel:UILabel = UILabel(frame: CGRectMake(0.0, 0.0, pickerView.frame.size.width, pickerView.frame.size.height))
            mainLabel.text = defaultTimerOptions[row]
            mainLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
            mainLabel.font = UIFont(name: "Courier", size: 40.0)
            mainLabel.textAlignment = .Center
            return mainLabel
            
        }else{
            
            var mainLabel:UILabel = UILabel(frame: CGRectMake(0.0, 0.0, pickerView.frame.size.width / 3, pickerView.frame.size.height))
            mainLabel.text = "\(row)"
            mainLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
            mainLabel.font = UIFont(name: "Courier", size: 40.0)
            mainLabel.textAlignment = .Center
            return mainLabel
        }
        
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        if(defaultOrCustomTimerToggleBool == true){
            
            return 1
            
        }else{
            
            return 3
        }
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if(defaultOrCustomTimerToggleBool == true){
            
            return defaultTimerOptions.count
            
        }else{
            
            if(component == 0){
                
                return 24
                
            }else if(component == 1){
                
                return 60
                
            }else{
                
                return 60
            }
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if(defaultOrCustomTimerToggleBool == true){
            
            finalValueForDefault = literalMeaningOfDefaultTimerOptions[row]
            defaultValueStringForm = defaultTimerOptions[row]
            
        }else{
            
            if(component == 0){
            
                hours = row
            
            }else if(component == 1){
            
                minutes = row
            
            }else if(component == 2){
            
                seconds = row
            
            }
        }
        
    }
    
    
    // toggling back and forth - default and custom times //
    func defaultTimeChange(sender:AnyObject){
        
        if(sender.selectedSegmentIndex == 0){
            
            defaultOrCustomTimerToggleBool = true
            timerPickerView.reloadAllComponents()
            hoursLabel?.hidden = true
            secondsLabel?.hidden = true
            minutesLabel!.frame = CGRectMake(timerPickerView.frame.origin.x, timerPickerView.frame.origin.y - 20.0, timerPickerView.frame.width, 20.0)
            
            minutesLabel!.text = "Default Times"
            
            
        }else{
            
            defaultOrCustomTimerToggleBool = false
            timerPickerView.reloadAllComponents()
            hoursLabel?.hidden = false
            secondsLabel?.hidden = false
            
            minutesLabel!.frame = CGRectMake(hoursLabel!.frame.origin.x + hoursLabel!.frame.width, timerPickerView.frame.origin.y - 20.0, timerPickerView.frame.width / 3, 20.0)
            
            minutesLabel?.text = "Min"
            
        }
        
    }
    
    
    func countUpValueChange(sender:AnyObject){
        
        if(sender.selectedSegmentIndex == 0){
            countUpOrCountDownBool = false
        }else{
            countUpOrCountDownBool = true
        }
        
    }
    
    // notifys the main view that the donebutton has been clicked //
    func doneButtonOnClick(){
        
        if(defaultOrCustomTimerToggleBool == true){
            
            delegate?.doneButtonClick()
            
            // send back the info //
            delegate?.returnTimerWithInfo(finalValueForDefault, countUpOrDown: countUpOrCountDownBool)
            
            
            // modifying the Information Intermediary singleton and then notifying the table view that //
            // it needs to update //
            InformationIntermediary.sharedInstance.timeInSeconds = finalValueForDefault
            InformationIntermediary.sharedInstance.literalTimeString = defaultValueStringForm
            InformationIntermediary.sharedInstance.countDownOrUpBool = countUpOrCountDownBool
            
            
            // send out a notification telling the side bar that it needs to update //
            let notifyOfDataChange = NSNotificationCenter.defaultCenter()
            notifyOfDataChange.postNotificationName("dataChange", object: self)
            
            
        }else{
        
            var tempTotalSecondsToSendBack = seconds + (minutes * 60) + (hours * 60 * 60)
        
            delegate?.doneButtonClick()
        
            // send back the info //
            delegate?.returnTimerWithInfo(tempTotalSecondsToSendBack, countUpOrDown: countUpOrCountDownBool)
            
            
            var tempHours = "00"
            var tempMinutes = "00"
            var tempSeconds = "00"
            
            if(hours < 10){
                tempHours = "0\(hours)"
            }else{
                tempHours = "\(hours)"
            }
            if(minutes < 10){
                tempMinutes = "0\(minutes)"
            }else{
                tempMinutes = "\(minutes)"
            }
            if(seconds < 10){
                tempSeconds = "0\(seconds)"
            }else{
                tempSeconds = "\(seconds)"
            }
            
            
            InformationIntermediary.sharedInstance.timeInSeconds = tempTotalSecondsToSendBack
            InformationIntermediary.sharedInstance.literalTimeString = "\(tempHours):\(tempMinutes):\(tempSeconds)"
            InformationIntermediary.sharedInstance.countDownOrUpBool = countUpOrCountDownBool
            
            // send out a notification telling the side bar that it needs to update //
            let notifyOfDataChange = NSNotificationCenter.defaultCenter()
            notifyOfDataChange.postNotificationName("dataChange", object: self)
        }
    }
    
    
    
    
}
