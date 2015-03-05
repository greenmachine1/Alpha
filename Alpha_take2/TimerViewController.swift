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

class TimerViewController: UIViewController{

    @IBOutlet weak var mainDatePicker: UIDatePicker!
    
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

}
