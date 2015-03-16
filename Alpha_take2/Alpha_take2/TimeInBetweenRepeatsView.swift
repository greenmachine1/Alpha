//
//  TimeInBetweenRepeatsView.swift
//  Alpha_take2
//
//  Created by Cory Green on 3/15/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

@objc protocol ReturnTimeInBetweenRepeatsInfoDelegate{
    
    func doneButtonPressedInTimeInBetweenRepeatsView()
    
}

class TimeInBetweenRepeatsView: UIView {

    var _callingView:UIView?
    var timerPickerView:UIPickerView = UIPickerView()
    var delegate:ReturnTimeInBetweenRepeatsInfoDelegate?
    
    func drawTimeInBetweenRepeats(callingView:UIView){
        
        _callingView = callingView
        
        self.frame = _callingView!.bounds
        
        var timerLabel:UILabel = UILabel(frame: CGRectMake(self.frame.origin.x + 20.0, self.frame.origin.y + 20.0, self.frame.width - 40.0, 20.0))
        timerLabel.text = "Set Time In Between Repeats Options"
        timerLabel.textColor = ColorPallete.sharedInstance.whiteColor
        timerLabel.textAlignment = .Center
        
        
        // custom info here //
        
        
        
        
        
        
        
        var doneButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        doneButton.frame = CGRectMake(self.frame.origin.x + 20.0, self.frame.height - 60.0, self.frame.width - 40.0, 40.0)
        doneButton.backgroundColor = ColorPallete.sharedInstance.darkGreenColor
        doneButton.setTitle("Done", forState: UIControlState.Normal)
        doneButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        doneButton.addTarget(self, action: "doneButtonOnClick", forControlEvents: UIControlEvents.TouchUpInside)
        doneButton.layer.cornerRadius = 10.0
        doneButton.clipsToBounds = true
        
        self.addSubview(timerLabel)
        self.addSubview(doneButton)
    }
    
    // done button pressed //
    func doneButtonOnClick(){
        
        delegate?.doneButtonPressedInTimeInBetweenRepeatsView()
        
    }
}
