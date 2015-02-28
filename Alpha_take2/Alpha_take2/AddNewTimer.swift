//
//  AddNewTimer.swift
//  Alpha_take2
//
//  Created by Cory Green on 2/25/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

@objc protocol ReturnInformationAboutTimerDelegate{
    
    func returnEventInfo(#name:String, time:Int, repeats:Bool, ifRepeatsHowManyTimes:Int)
    
}

class AddNewTimer: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mainPickerView: UIPickerView!
    @IBOutlet weak var defaultCustomSegment: UISegmentedControl!
    
    var hoursArray:Array<AnyObject> = ["Hours"]
    var minutesArray:Array<AnyObject> = ["Minutes"]
    var seconds:Array<AnyObject> = ["Seconds"]
    var defaultArray:Array<String> = ["30 Seconds", "1 Minute", "5 Minutes", "10 Minutes", "15 Minutes", "30 Minutes", "1 Hour", "5 Hours"]
    
    var toggleDefaultCustom:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainPickerView.delegate = self
        
        // appending the actual time to the hours, minutes, and seconds array //
        for(var i = 0; i < 60; i++){
            
            if(i < 13){
                hoursArray.append("\(i)")
            }
            minutesArray.append("\(i)")
            seconds.append("\(i)")
        }
        
        
        
    }
    
    @IBAction func defaultCustomSegmentOnClick(sender: AnyObject) {
        
        if(sender.selectedSegmentIndex == 0){
            
            toggleDefaultCustom = false
            mainPickerView.reloadAllComponents()
            
        }else if(sender.selectedSegmentIndex == 1){
            
            toggleDefaultCustom = true
            mainPickerView.reloadAllComponents()
            
        }
        
    }
    
    
    
    
    
    // **** time selection section **** //
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        if(toggleDefaultCustom == true){
        
            if(component == 0){
            
                return hoursArray[row] as String
            
            }else if (component == 1){
            
                return minutesArray[row] as String
            
            }else if(component == 2){
            
                return seconds[row] as String
            }
            
        }else{
            
            return defaultArray[row]
            
        }
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if(toggleDefaultCustom == true){
        
            if(component == 0){
            
                return hoursArray.count
            
            }else if(component == 1){
            
                return minutesArray.count
            
            }else if(component == 2){
            
                return seconds.count
            }
        }else{
            
            return defaultArray.count
        }
        
        return 0
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        if(toggleDefaultCustom == false){
            
            return 1
            
        }else{
            
            return 3
        }
  
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
