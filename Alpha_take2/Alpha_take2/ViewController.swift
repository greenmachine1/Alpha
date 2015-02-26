//
//  ViewController.swift
//  Alpha_take2
//
//  Created by Cory Green on 2/25/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timerObjectDictionary:[String:TimerObject] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }

    @IBAction func addNewOnClick(sender: UIButton) {
        
        /*
        var timer:TimerObject = TimerObject(personName: "Cory", additionOrSubtraction: true)
        
        // inserting an object into the dictionary //
        timerObjectDictionary.updateValue(timer, forKey: "Cory")
        */
        
        
        var newTimer = self.storyboard?.instantiateViewControllerWithIdentifier("Timer") as UIViewController
        self.navigationController?.pushViewController(newTimer, animated: true)
    }
}

