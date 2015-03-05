//
//  TimerViewController.swift
//  Alpha_take2
//
//  Created by Cory Green on 3/4/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

@objc protocol ReturnTimerInfo{
    
    func returnTime(#hour:Int, minutes:Int)
    
}

class TimerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var mainPickerView: UIPickerView!
    var delegate:ReturnTimerInfo?
    
    var hours:Int = 0
    var minutes:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: "doneButtonOnClick")
        self.navigationItem.rightBarButtonItem = doneButton
    }
    
    func doneButtonOnClick(){
        
        delegate?.returnTime(hour: hours, minutes: minutes)
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if (component == 0){
            
            return 13
            
        }else{
            
            return 60
        }
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        return "\(row)"
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(component == 0){
            
            hours = row
            
        }else{
            
            minutes = row
        }
    }
}
