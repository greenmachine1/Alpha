//
//  InformationIntermediary.swift
//  Alpha_take2
//
//  Created by Cory Green on 3/18/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit


// class used to pass information back and forth between multiple classes //
class InformationIntermediary: NSObject {
    
    var timeInSeconds:Int = 0
    var literalTimeString = "00:00:00"
    var eventName = ""
    
    
    class var sharedInstance: InformationIntermediary{
        
        struct Static{
            
            static let instance:InformationIntermediary = InformationIntermediary()
            
        }
        
        return Static.instance
    }
}
