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
        
        let blurView:UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
        blurView.frame = self.bounds
        
        
        self.addSubview(blurView)
        
        var timeBetweenLabel:UILabel = UILabel(frame: CGRectMake(self.frame.origin.x + 20.0, self.frame.origin.y + 20.0, self.frame.width - 40.0, 20.0))
        timeBetweenLabel.text = "Set Time In Between Repeats Options"
        timeBetweenLabel.textColor = ColorPallete.sharedInstance.whiteColor
        timeBetweenLabel.textAlignment = .Center
        
        
        // custom info here //
        
        
        
        
        
        
        
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
        
        self.addSubview(timeBetweenLabel)
        self.addSubview(doneButton)
    }
    
    // done button pressed //
    func doneButtonOnClick(){
        
        delegate?.doneButtonPressedInTimeInBetweenRepeatsView()
        
    }
}
