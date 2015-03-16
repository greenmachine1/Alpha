//
//  popUpUI.swift
//  Alpha_take2
//
//  Created by Cory Green on 3/13/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

class popUpUI: UIView, ReturnInfoDelegate, ReturnInfoRepeatsOptionDelegate, ReturnInfoFromColorSchemeViewDelegate, ReturnTimeInBetweenRepeatsInfoDelegate {
    
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
        if(row == 2){
        
            var timerPicker:TimePickerUIView = TimePickerUIView()
            timerPicker.delegate = self
            timerPicker.drawPickerView(self)
        
            self.addSubview(timerPicker)
        }else if(row == 4){
            
            var repeatsView:RepeatsTimerView = RepeatsTimerView()
            repeatsView.drawRepeatsView(self)
            repeatsView.delegate = self
            
            self.addSubview(repeatsView)
        }else if(row == 6){
            
            var timeInBetweenView:TimeInBetweenRepeatsView = TimeInBetweenRepeatsView()
            timeInBetweenView.drawTimeInBetweenRepeats(self)
            timeInBetweenView.delegate = self
            
            self.addSubview(timeInBetweenView)
        }else if(row == 8){
            
            var colorSchemeView:SetColorSchemeView = SetColorSchemeView()
            colorSchemeView.drawColorSchemeView(self)
            colorSchemeView.delegate = self
            
            self.addSubview(colorSchemeView)
        }
    }
    
    
    
    
    
    // ******** timer picker section ******** //
    
    
    // done button click from next UIView() //
    func doneButtonClick() {
        
        self.moveViewDown()

    }
    
    // what is returned from the TimePickerUIView //
    func returnTimerWithInfo(totalTimeInseconds: Int, countUpOrDown: Bool) {
        
        println("total time in seconds \(totalTimeInseconds) and count up or down \(countUpOrDown)")
        
    }
    
    
    
    
    
    
    
    // ******** repeats timer section ******** //
    
    
    // done button from the Repeats Timer view //
    func doneButtonPressedFromRepeatsView() {
        
        self.moveViewDown()
        
    }
    
    
    
    // ******* Color scheme section ******** //
    
    
    // done button from the color scheme view //
    func returnDoneButtonPressedFromColorScheme() {
        
        self.moveViewDown()
    }
    
    
    
    
    
    
    // ******* time in between repeats section ******** //
    
    
    // done button from time in between view //
    func doneButtonPressedInTimeInBetweenRepeatsView() {
        
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
