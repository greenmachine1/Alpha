//
//  TimerObject.swift
//  Alpha_take2
//
//  Created by Cory Green on 3/30/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

@objc protocol ReturnTimerDelegate{
    
    func returnTimeAndName(name:String, time:Int)
    
}

class TimerObject: NSObject {
    
    var _name:String = ""
    var _time:Int = 0
    var _countUpOrDown:Bool = false
    var _numberOfRepeats:Int = 0
    var _timeForRepeats:Int = 0
    
    var newTimer:NSTimer = NSTimer()
    
    var count:Int = 0
    
    var delegate:ReturnTimerDelegate?
    
    
    override init(){
        super.init()
        
        
    }
    
    
    func startTimer(){
        
        newTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "timerFire", userInfo: nil, repeats: true)
        newTimer.fire()
        
    }
    
    func timerFire(){
        
        count++
        if(count != _time){
            
            delegate?.returnTimeAndName(_name, time: count)
            
        }else{
            newTimer.invalidate()
        }
        
    }
    
       
}
