//
//  SetColorSchemeView.swift
//  Alpha_take2
//
//  Created by Cory Green on 3/15/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

@objc protocol ReturnInfoFromColorSchemeViewDelegate{
    
    func returnDoneButtonPressedFromColorScheme()
    
}

class SetColorSchemeView: UIView, UIPickerViewDataSource, UIPickerViewDelegate {

    var _callingView:UIView?
    var timerPickerView:UIPickerView = UIPickerView()
    var delegate:ReturnInfoFromColorSchemeViewDelegate?
    var colorPicker:UIPickerView = UIPickerView()
    
    
    var leftSetOfColors:[UIColor] = [UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)]
    var centerSetOfColors:[UIColor] = [UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)]
    var rightSetOfColors:[UIColor] = [UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)]

    func drawColorSchemeView(callingView:UIView){
        
        self.setColors()
        
        _callingView = callingView
        
        self.frame = _callingView!.bounds
        
        let blurView:UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
        blurView.frame = self.bounds
        
        
        self.addSubview(blurView)
        
        var colorLabel:UILabel = UILabel(frame: CGRectMake(self.frame.origin.x + 20.0, self.frame.origin.y + 20.0, self.frame.width - 40.0, 20.0))
        colorLabel.text = "Set Color Scheme Options"
        colorLabel.textColor = ColorPallete.sharedInstance.whiteColor
        colorLabel.textAlignment = .Center
        
        
        
        
        
        
        
        colorPicker = UIPickerView(frame: CGRectMake((self.frame.width / 2) - (colorPicker.frame.width / 2) + 40.0, (self.frame.height / 2) - (colorPicker.frame.height / 2), self.frame.width - 40.0, 162))
        
        colorPicker.delegate = self
        colorPicker.backgroundColor = UIColor.clearColor()
        colorPicker.layer.borderColor = ColorPallete.sharedInstance.deepBlueColor.CGColor
        colorPicker.layer.borderWidth = 1.0
        colorPicker.layer.cornerRadius = 10.0
        colorPicker.clipsToBounds = true
        
        
        
        var normalColorLabel:UILabel = UILabel(frame: CGRectMake(colorPicker.frame.origin.x, colorPicker.frame.origin.y - 20.0, colorPicker.frame.width / 3, 20.0))
        normalColorLabel.text = "Normal"
        normalColorLabel.textAlignment = .Center
        normalColorLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
        
        var halfTimeColorLabel:UILabel = UILabel(frame: CGRectMake(normalColorLabel.frame.origin.x + normalColorLabel.frame.width, normalColorLabel.frame.origin.y, normalColorLabel.frame.width, normalColorLabel.frame.height))
        halfTimeColorLabel.text = "1/2 Time"
        halfTimeColorLabel.textAlignment = .Center
        halfTimeColorLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
        
        var threeForthsDoneColorLabel:UILabel = UILabel(frame: CGRectMake(halfTimeColorLabel.frame.origin.x + halfTimeColorLabel.frame.width, halfTimeColorLabel.frame.origin.y, halfTimeColorLabel.frame.width, halfTimeColorLabel.frame.height))
        threeForthsDoneColorLabel.text = "3/4 Time"
        threeForthsDoneColorLabel.textAlignment = .Center
        threeForthsDoneColorLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
        
        
        
        
        
        
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
        
        self.addSubview(colorLabel)
        self.addSubview(doneButton)
        self.addSubview(colorPicker)
        self.addSubview(normalColorLabel)
        self.addSubview(halfTimeColorLabel)
        self.addSubview(threeForthsDoneColorLabel)
    }
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return leftSetOfColors.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView {
        
        var mainLabel:UILabel = UILabel(frame: CGRectMake(0.0, 0.0, pickerView.frame.size.width / 3, pickerView.frame.size.height))
        
        
        
        // iterating through all the colors for each component //
        if(component == 0){
            mainLabel.backgroundColor = leftSetOfColors[row]
        }else if(component == 1){
            mainLabel.backgroundColor = centerSetOfColors[row]
        }else{
            mainLabel.backgroundColor = rightSetOfColors[row]
        }
        
        return mainLabel
    }
    
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(component == 0){
            
            InformationIntermediary.sharedInstance.leftColor = leftSetOfColors[row]
            
        }else if(component == 1){
            
            InformationIntermediary.sharedInstance.centerColor = centerSetOfColors[row]
            
        }else if(component == 2){
            
            InformationIntermediary.sharedInstance.rightColor = rightSetOfColors[row]
            
        }
        
        
    }
    
    // done button pressed //
    func doneButtonOnClick(){
        
        delegate?.returnDoneButtonPressedFromColorScheme()
        
        let notifyOfDataChange = NSNotificationCenter.defaultCenter()
        notifyOfDataChange.postNotificationName("dataChange", object: self)
        
    }
    
    
    
    
    func setColors(){

        for(var i = 0.0; i < 1.2; i = i + 0.2){
            
            for(var j = 0.0; j < 1.2; j = j + 0.2){
                
                for(var k = 0.0; k < 1.2; k = k + 0.2){
                    
                    leftSetOfColors.append(UIColor(red: CGFloat(i), green: CGFloat(j), blue: CGFloat(k), alpha: 0.9))
                    centerSetOfColors.append(UIColor(red: CGFloat(i), green: CGFloat(j), blue: CGFloat(k), alpha: 0.9))
                    rightSetOfColors.append(UIColor(red: CGFloat(i), green: CGFloat(j), blue: CGFloat(k), alpha: 0.9))
                }
            }
        }
        
        println("count \(leftSetOfColors.count)")
        
    }


}
