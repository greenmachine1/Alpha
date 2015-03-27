//
//  TimerObject.swift
//  Alpha_take2
//
//  Created by Cory Green on 3/26/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

class TimerObject: NSObject {
    
    var _name:String = ""
    var _timeInSeconds:Int = 0
    
    // false means count down //
    var _countUpOrDown:Bool = false
    var _numberOfTimesInBetweenTimer:Int = 0
    var _timeInBetweenTimers:Int = 0
    
    var _firstColor:UIColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
    var _secondColor:UIColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
    var _thirdColor:UIColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
    
    override init(){
        super.init()
    }
    
    
   
}


