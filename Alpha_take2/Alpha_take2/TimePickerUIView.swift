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
    
}

class TimePickerUIView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {

    var _callingView:UIView?
    var timerPickerView:UIPickerView = UIPickerView()
    
    var delegate:ReturnInfoDelegate?
    
    func drawPickerView(callingView:UIView){
        
        _callingView = callingView
        
        self.frame = _callingView!.bounds
        
        var timerLabel:UILabel = UILabel(frame: CGRectMake(self.frame.origin.x + 20.0, self.frame.origin.y + 20.0, self.frame.width - 40.0, 20.0))
        timerLabel.text = "Set Timer"
        timerLabel.textColor = ColorPallete.sharedInstance.whiteColor
        timerLabel.textAlignment = .Center
        
        
        
        // timer picker view //
        timerPickerView.frame = CGRectMake(self.frame.origin.x + 20.0, timerLabel.frame.origin.y + timerLabel.frame.height, self.frame.width - 40.0, 162.0)
        
        timerPickerView.delegate = self
        timerPickerView.backgroundColor = ColorPallete.sharedInstance.greenColor
        timerPickerView.layer.cornerRadius = 10.0
        
        
        
        
        
        
        var doneButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        doneButton.frame = CGRectMake(self.frame.origin.x + 20.0, self.frame.height - 60.0, self.frame.width - 40.0, 40.0)
        doneButton.backgroundColor = ColorPallete.sharedInstance.darkGreenColor
        doneButton.setTitle("Done", forState: UIControlState.Normal)
        doneButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        doneButton.addTarget(self, action: "doneButtonOnClick", forControlEvents: UIControlEvents.TouchUpInside)
        doneButton.layer.cornerRadius = 10.0
        doneButton.clipsToBounds = true
        
        self.addSubview(timerLabel)
        self.addSubview(timerPickerView)
        self.addSubview(doneButton)
    }
    
    
    // notifys the main view that the donebutton has been clicked //
    func doneButtonOnClick(){
        
        delegate?.doneButtonClick()
        
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
        
        println("selected - \(row) and \(component)")
        
    }
    
    
}
