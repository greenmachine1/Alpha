//
//  ViewController.swift
//  Alpha_take2
//
//  Created by Cory Green on 2/25/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var addNewTimerButton = UIBarButtonItem(title: "New Timer", style: UIBarButtonItemStyle.Plain, target: self, action: "addTimerButtonOnClick")
        self.navigationItem.rightBarButtonItem = addNewTimerButton
        
    }
    
    
    
    
    // adding a new timer //
    func addTimerButtonOnClick(){
        
        var addNewTimerController = self.storyboard?.instantiateViewControllerWithIdentifier("Timer") as TimerViewController
        
        self.navigationController?.pushViewController(addNewTimerController, animated: true)
    }
    
}

