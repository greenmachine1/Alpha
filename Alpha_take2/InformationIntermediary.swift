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
    
    // true is count down, false is count up //
    var countDownOrUpBool:Bool = true
    
    var repeats:Bool = false
    var numberOfRepeats:Int = 0
    var timeInBetweenRepeatsInSeconds:Int = 0
    var timeInBetweenRepeatsLiteralString:String = ""
    
    var leftColor:UIColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    var centerColor:UIColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
    var rightColor:UIColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
    
    class var sharedInstance: InformationIntermediary{
        
        struct Static{
            
            static let instance:InformationIntermediary = InformationIntermediary()
            
        }
        
        return Static.instance
    }
    
    
    
    func deleteData(){
        
        timeInSeconds = 0
        literalTimeString = "00:00:00"
        eventName = ""
        countDownOrUpBool = false
        repeats = false
        timeInBetweenRepeatsInSeconds = 0
        timeInBetweenRepeatsLiteralString = ""
        
        leftColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        centerColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        rightColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
    }
}
