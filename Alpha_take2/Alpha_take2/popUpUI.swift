//
//  popUpUI.swift
//  Alpha_take2
//
//  Created by Cory Green on 3/13/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

class popUpUI: UIView, ReturnInfoDelegate {
    
    var _callingView:UIView?
    var _rowSelected:Int?
    
    func redrawView(callingView:UIView, rowSelected:Int){
        
        _callingView = callingView
        _rowSelected = rowSelected
        
        self.frame = CGRectMake(20.0, callingView.frame.height, callingView.frame.width - 40.0, callingView.frame.height - 100.0)
        self.backgroundColor = UIColor.clearColor()
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
        
        let blurView:UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
        blurView.frame = self.bounds
        
        
        // adding things to the layer //
        self.addSubview(blurView)

        self.displayContent(_rowSelected!)
        
        callingView.addSubview(self)
        
    }
    
    // displaying the content based on which row selected //
    func displayContent(row:Int){
        
        
        // for the time picker view //
        //if(row == 2){
        
            var timerPicker:TimePickerUIView = TimePickerUIView()
            timerPicker.delegate = self
            timerPicker.drawPickerView(self)
        
            self.addSubview(timerPicker)
        //}
    }
    
    
    
    // done button click from next UIView() //
    func doneButtonClick() {
        
        self.moveViewDown()
        
    }
    
    
    func moveViewUp(){
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            
            self.frame = CGRectMake(20.0, 80.0, self._callingView!.frame.width - 40.0, self._callingView!.frame.height - 100.0)
            
        })
    }
    
    func moveViewDown(){
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            
            self.frame = CGRectMake(20.0, self._callingView!.frame.height, self._callingView!.frame.width - 40.0, self._callingView!.frame.height - 100.0)
            
        })
    }

    

    

}
