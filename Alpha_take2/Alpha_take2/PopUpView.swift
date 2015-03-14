//
//  PopUpView.swift
//  Alpha_take2
//
//  Created by Cory Green on 3/12/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit
import Foundation

@objc protocol ReturnInfoBackToMainDelegate{
    
    func isOpen()
    func isClosed()
    
}

class PopUpView: NSObject, UITextFieldDelegate{
   
    var _view:UIView?
    var overlayView:UIView = UIView()
    var rowSelected:Int?
    var delegate:ReturnInfoBackToMainDelegate?
    
    override init(){
        super.init()
    }
    
    init(callingView:UIView, rowCameFrom:Int) {
        super.init()
        
        _view = callingView
        rowSelected = rowCameFrom
        
        overlayView.frame = CGRectMake(_view!.frame.origin.x + 20.0, _view!.frame.origin.y + _view!.frame.height, _view!.frame.width - 40.0, _view!.frame.height - 100.0)
        
        overlayView.backgroundColor = UIColor.clearColor()
        overlayView.layer.cornerRadius = 10.0
        overlayView.clipsToBounds = true
        
        // blur view //
        let blurView:UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
        blurView.frame = overlayView.bounds
        
        
        // done button //
        var doneButton:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        doneButton.frame = CGRectMake(overlayView.frame.origin.x, overlayView.frame.height - 60.0, overlayView.frame.width - 40.0, 40.0)
        doneButton.setTitle("Done", forState: UIControlState.Normal)
        doneButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        doneButton.backgroundColor = ColorPallete.sharedInstance.darkGreenColor
        doneButton.layer.cornerRadius = 10.0
        doneButton.addTarget(self, action: "doneButtonOnClick", forControlEvents: UIControlEvents.TouchUpInside)
        
        overlayView.addSubview(blurView)
        overlayView.addSubview(doneButton)
        
        callingView.addSubview(overlayView)
        
    }
    

    
    
    
    func moveUpPopUp(){
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.overlayView.frame = CGRectMake(self._view!.frame.origin.x + 20.0, self._view!.frame.origin.y + 80, self._view!.frame.width - 40.0, self._view!.frame.height - 100.0)
        })
    }
    
    func moveDownPopUp(){
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.overlayView.frame = CGRectMake(self._view!.frame.origin.x + 20.0, self._view!.frame.origin.y - self._view!.frame.height, self._view!.frame.width - 40.0, self._view!.frame.height - 100.0)
        })
        
    }


    
}
