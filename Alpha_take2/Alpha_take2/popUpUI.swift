//
//  popUpUI.swift
//  Alpha_take2
//
//  Created by Cory Green on 3/13/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

class popUpUI: UIView {
    
    var callingView:UIView?

    func redrawView(){
        
        println("calling view \(callingView!.frame)")
        self.frame = CGRectMake(20.0, callingView!.frame.height, callingView!.frame.width - 40.0, callingView!.frame.height - 100.0)
        self.backgroundColor = UIColor.clearColor()
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
        
        let blurView:UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
        blurView.frame = self.bounds
        
        
        var doneButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        doneButton.frame = CGRectMake(self.frame.origin.x, self.frame.height - 60.0, self.frame.width - 40.0, 40.0)
        doneButton.backgroundColor = ColorPallete.sharedInstance.darkGreenColor
        doneButton.setTitle("Done", forState: UIControlState.Normal)
        doneButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        doneButton.addTarget(self, action: "doneButtonOnClick", forControlEvents: UIControlEvents.TouchUpInside)
        doneButton.layer.cornerRadius = 10.0
        doneButton.clipsToBounds = true
        
        self.addSubview(blurView)
        self.addSubview(doneButton)
        callingView!.addSubview(self)
        
    }
    
    
    func moveViewUp(){
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            
            self.frame = CGRectMake(20.0, 80.0, self.callingView!.frame.width - 40.0, self.callingView!.frame.height - 100.0)
            
        })
    }
    
    func moveViewDown(){
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            
            self.frame = CGRectMake(20.0, self.callingView!.frame.height, self.callingView!.frame.width - 40.0, self.callingView!.frame.height - 100.0)
            
        })
    }
    
    
    func doneButtonOnClick(){
        
        self.moveViewDown()
    }
    

    

}
