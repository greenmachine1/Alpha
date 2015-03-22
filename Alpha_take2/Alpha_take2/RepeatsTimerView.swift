//
//  RepeatsTimerView.swift
//  Alpha_take2
//
//  Created by Cory Green on 3/15/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

@objc protocol ReturnInfoRepeatsOptionDelegate{
    
    func doneButtonPressedFromRepeatsView()
    
}

class RepeatsTimerView: UIView, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var _callingView:UIView?
    var timerPickerView:UIPickerView = UIPickerView()
    
    var numberOfRepeatsAndTimePickerView:UIPickerView = UIPickerView()
    
    var numberOfRepeats = ["1", "2", "3", "4", "5", "10", "15", "20", "30", "50", "100", "Forever"]
    var literalNumberOfRepeats = [1, 2, 3, 4, 5, 10, 15, 20, 30, 50, 100, 0]
    var timeInBetweenRepeats = ["0","5 Sec", "10 Sec", "15 Sec", "30 Sec", "45 Sec", "1 Min", "5 Min"]
    var literalTimeInBetweenRepeats = [0,5, 10, 15, 30, 45, 60, 300]
    
    var _numberOfRepeats:Int = 0
    var _timeForRepeats:Int = 0
    
    var _literalNumberOfRepeats:String = ""
    var _literalTimeForRepeats:String = ""
    
    var delegate:ReturnInfoRepeatsOptionDelegate?

    func drawRepeatsView(callingView:UIView){
        
        _callingView = callingView
        
        self.frame = _callingView!.bounds
        
        var repeatsLabel:UILabel = UILabel(frame: CGRectMake(self.frame.origin.x + 20.0, self.frame.origin.y + 20.0, self.frame.width - 40.0, 20.0))
        repeatsLabel.text = "Set Repeat Options"
        repeatsLabel.textColor = ColorPallete.sharedInstance.whiteColor
        repeatsLabel.textAlignment = .Center
        
        

        // Repeats info picker view //
        numberOfRepeatsAndTimePickerView = UIPickerView(frame: CGRectMake((self.frame.width / 2) - (numberOfRepeatsAndTimePickerView.frame.width / 2) + 40.0, (self.frame.height / 2) - (numberOfRepeatsAndTimePickerView.frame.height / 2), self.frame.width - 40.0, 162))
        
        numberOfRepeatsAndTimePickerView.delegate = self
        numberOfRepeatsAndTimePickerView.backgroundColor = UIColor.clearColor()
        numberOfRepeatsAndTimePickerView.layer.cornerRadius = 10.0
        numberOfRepeatsAndTimePickerView.clipsToBounds = true
        numberOfRepeatsAndTimePickerView.layer.borderColor = ColorPallete.sharedInstance.deepBlueColor.CGColor
        numberOfRepeatsAndTimePickerView.layer.borderWidth = 1.0
        
        var numberOfRepeatsLabel:UILabel = UILabel(frame: CGRectMake(numberOfRepeatsAndTimePickerView.frame.origin.x, numberOfRepeatsAndTimePickerView.frame.origin.y - 20.0, numberOfRepeatsAndTimePickerView.frame.width / 2, 20.0))
        numberOfRepeatsLabel.text = "Number"
        numberOfRepeatsLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
        numberOfRepeatsLabel.textAlignment = .Center
        
        var timeInBetweenLabel:UILabel = UILabel(frame: CGRectMake(numberOfRepeatsLabel.frame.origin.x + numberOfRepeatsLabel.frame.width, numberOfRepeatsLabel.frame.origin.y, numberOfRepeatsAndTimePickerView.frame.width / 2, 20.0))
        timeInBetweenLabel.text = "Time"
        timeInBetweenLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
        timeInBetweenLabel.textAlignment = .Center
        
        
        
        
        
        
        var doneButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        doneButton.frame = CGRectMake(self.frame.origin.x + 20.0, self.frame.height - 60.0, self.frame.width - 40.0, 40.0)
        doneButton.backgroundColor = ColorPallete.sharedInstance.darkGreenColor
        doneButton.setTitle("Done", forState: UIControlState.Normal)
        doneButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        doneButton.addTarget(self, action: "doneButtonOnClick", forControlEvents: UIControlEvents.TouchUpInside)
        doneButton.layer.cornerRadius = 10.0
        doneButton.clipsToBounds = true
        
        self.addSubview(repeatsLabel)
        self.addSubview(doneButton)
        self.addSubview(numberOfRepeatsAndTimePickerView)
        self.addSubview(numberOfRepeatsLabel)
        self.addSubview(timeInBetweenLabel)
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if(component == 0){
            return numberOfRepeats.count
        }else if(component == 1){
            return 1
        }else{
            return literalTimeInBetweenRepeats.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView {
        
        if(component == 0){
            
            var mainLabel:UILabel = UILabel(frame: CGRectMake(0.0, 0.0, pickerView.frame.size.width / 2, pickerView.frame.size.height))
            
            mainLabel.text = "\(numberOfRepeats[row])"
            mainLabel.textAlignment = .Center
            mainLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
            mainLabel.font = UIFont(name: "Courier", size: 20.0)
            mainLabel.backgroundColor = UIColor.clearColor()
        
            return mainLabel
            
        }else if(component == 1){
            
            var mainLabel:UILabel = UILabel(frame: CGRectMake(0.0, 0.0, pickerView.frame.size.width / 2, pickerView.frame.size.height))
            mainLabel.text = "X"
            mainLabel.textAlignment = .Center
            mainLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
            mainLabel.font = UIFont(name: "Courier", size: 20.0)
            mainLabel.backgroundColor = UIColor.clearColor()
            
            return mainLabel
            
        }else{
            
            var mainLabel:UILabel = UILabel(frame: CGRectMake(0.0, 0.0, pickerView.frame.size.width / 2, pickerView.frame.size.height))
            mainLabel.text = timeInBetweenRepeats[row]
            mainLabel.textAlignment = .Center
            mainLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
            mainLabel.font = UIFont(name: "Courier", size: 20.0)
            mainLabel.backgroundColor = UIColor.clearColor()
            
            return mainLabel
            
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(component == 0){
            
            _numberOfRepeats = literalNumberOfRepeats[row]
            _literalNumberOfRepeats = "\(numberOfRepeats[row])"
            
        }else if(component == 2){
            
            _timeForRepeats = literalTimeInBetweenRepeats[row]
            _literalTimeForRepeats = "\(timeInBetweenRepeats[row])"
            
        }
    }
    
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    // done button pressed //
    func doneButtonOnClick(){
        
        delegate?.doneButtonPressedFromRepeatsView()
        
        InformationIntermediary.sharedInstance.numberOfRepeats = _numberOfRepeats
        InformationIntermediary.sharedInstance.timeInBetweenRepeatsInSeconds = _timeForRepeats
        InformationIntermediary.sharedInstance.timeInBetweenRepeatsLiteralString = "\(_literalNumberOfRepeats) X \(_literalTimeForRepeats)"
        
        let notifyOfDataChange = NSNotificationCenter.defaultCenter()
        notifyOfDataChange.postNotificationName("dataChange", object: self)
        
        
    }



}
