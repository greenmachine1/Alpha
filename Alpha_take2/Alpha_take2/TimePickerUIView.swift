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
    
}

class TimePickerUIView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {

    var _callingView:UIView?
    var timerPickerView:UIPickerView = UIPickerView()
    
    var delegate:ReturnInfoDelegate?
    
    var hours:Int = 0
    var minutes:Int = 0
    var seconds:Int = 0
    
    // the count up or count down bool is default set to true for being //
    // count down //
    var countUpOrCountDownBool:Bool = true
    
    func drawPickerView(callingView:UIView){
        
        _callingView = callingView
        
        self.frame = _callingView!.bounds
        
        var timerLabel:UILabel = UILabel(frame: CGRectMake(self.frame.origin.x + 20.0, self.frame.origin.y + 20.0, self.frame.width - 40.0, 20.0))
        timerLabel.text = "Set Timer"
        timerLabel.textColor = ColorPallete.sharedInstance.whiteColor
        timerLabel.textAlignment = .Center
        
        
        // done button //
        var doneButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        doneButton.frame = CGRectMake(self.frame.origin.x + 20.0, self.frame.height - 60.0, self.frame.width - 40.0, 40.0)
        doneButton.backgroundColor = ColorPallete.sharedInstance.darkGreenColor
        doneButton.setTitle("Done", forState: UIControlState.Normal)
        doneButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        doneButton.addTarget(self, action: "doneButtonOnClick", forControlEvents: UIControlEvents.TouchUpInside)
        doneButton.layer.cornerRadius = 10.0
        doneButton.clipsToBounds = true
        
        
        
        
        
        
        
        // timer picker view //
        timerPickerView.frame = CGRectMake((self.frame.width / 2) - (timerPickerView.frame.width / 2) + 40.0, (self.frame.height / 2) - (timerPickerView.frame.height / 2), self.frame.width - 40.0, 162.0)

        timerPickerView.delegate = self
        timerPickerView.backgroundColor = ColorPallete.sharedInstance.greenColor
        timerPickerView.layer.cornerRadius = 10.0
        
        
        // timer labels //
        var hoursLabel:UILabel = UILabel(frame: CGRectMake(self.frame.origin.x + 20.0, timerPickerView.frame.origin.y - 20.0, timerPickerView.frame.width / 3, 20.0))
        hoursLabel.text = "Hrs"
        hoursLabel.textColor = ColorPallete.sharedInstance.darkGreenColor
        hoursLabel.textAlignment = .Center
        
        var minutesLabel:UILabel = UILabel(frame: CGRectMake(hoursLabel.frame.origin.x + hoursLabel.frame.width, timerPickerView.frame.origin.y - 20.0, timerPickerView.frame.width / 3, 20.0))
        minutesLabel.text = "Min"
        minutesLabel.textColor = ColorPallete.sharedInstance.darkGreenColor
        minutesLabel.textAlignment = .Center
        
        var secondsLabel:UILabel = UILabel(frame: CGRectMake(minutesLabel.frame.origin.x + minutesLabel.frame.width, timerPickerView.frame.origin.y - 20.0, timerPickerView.frame.width / 3, 20.0))
        secondsLabel.text = "Sec"
        secondsLabel.textColor = ColorPallete.sharedInstance.darkGreenColor
        secondsLabel.textAlignment = .Center
        
        
        
        
        
        
        
        // default segment control and count up or down segment controls //
        // their position will be dependant on the space between the //
        // time picker view and the done button //
        var spaceInBetweenPickerViewAndDoneButton = doneButton.frame.origin.y - (timerPickerView.frame.origin.y + timerPickerView.frame.height)
        
        var spaceForEach = (spaceInBetweenPickerViewAndDoneButton / 3) - 15.0

        
        var defaultTimesSegmentControl:UISegmentedControl = UISegmentedControl(items: ["Default Times", "Custom Times"])
        defaultTimesSegmentControl.frame = CGRectMake(timerPickerView.frame.origin.x, timerPickerView.frame.origin.y + timerPickerView.frame.height + spaceForEach, timerPickerView.frame.width, 20.0)
        defaultTimesSegmentControl.selectedSegmentIndex = 1
        defaultTimesSegmentControl.addTarget(self, action: "defaultTimeChange:", forControlEvents: UIControlEvents.ValueChanged)
        
        
        
        var countUpOrDownSegmentControl:UISegmentedControl = UISegmentedControl(items: ["Count up", "Count down"])
        countUpOrDownSegmentControl.frame = CGRectMake(defaultTimesSegmentControl.frame.origin.x, defaultTimesSegmentControl.frame.origin.y + defaultTimesSegmentControl.frame.height + spaceForEach, defaultTimesSegmentControl.frame.width, 20.0)
        countUpOrDownSegmentControl.selectedSegmentIndex = 1
        countUpOrDownSegmentControl.addTarget(self, action: "countUpValueChange:", forControlEvents: UIControlEvents.ValueChanged)
        

        self.addSubview(timerLabel)
        self.addSubview(timerPickerView)
        self.addSubview(hoursLabel)
        self.addSubview(minutesLabel)
        self.addSubview(secondsLabel)
        self.addSubview(defaultTimesSegmentControl)
        self.addSubview(countUpOrDownSegmentControl)
        
        self.addSubview(doneButton)
    }
    
    

    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        return "\(row)"
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if(component == 0){
            return 13
        }else if(component == 1){
            return 60
        }else{
            return 60
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(component == 0){
            
            hours = row
            
        }else if(component == 1){
            
            minutes = row
            
        }else if(component == 2){
            
            seconds = row
            
        }
        
    }
    
    func defaultTimeChange(sender:AnyObject){
        
        println("sender \(sender.selectedSegmentIndex)")
        
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
        
        var tempTotalSecondsToSendBack = seconds + (minutes * 60) + (hours * 60 * 60)
        
        delegate?.doneButtonClick()
        
        // send back the info //
        delegate?.returnTimerWithInfo(tempTotalSecondsToSendBack, countUpOrDown: countUpOrCountDownBool)
        
    }
    
    
    
    
}
