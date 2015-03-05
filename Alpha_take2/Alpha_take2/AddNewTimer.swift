//
//  AddNewTimer.swift
//  Alpha_take2
//
//  Created by Cory Green on 2/25/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

class AddNewTimer: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: "doneButtonOnClick")
        self.navigationItem.rightBarButtonItem = doneButton

    }
    
    func doneButtonOnClick(){
        
        println("done button")
    }

}
