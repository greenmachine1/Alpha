//
//  TimerObject.swift
//  Alpha_take2
//
//  Created by Cory Green on 3/30/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

@objc protocol ReturnTimerDelegate{
    
    func returnTimeAndName(name:String, time:String)
    
}

class TimerObject: NSObject {
    
    var _name:String = ""
    var _time:Int = 0
    var _countUpOrDown:Bool = false
    var _numberOfRepeats:Int = 0
    var _timeForRepeats:Int = 0
    
    var newTimer:NSTimer = NSTimer()

    
    var delegate:ReturnTimerDelegate?
    
    
    override init(){
        super.init()
        
        
    }
    
    
    func startTimer(){
        
        newTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "timerFire", userInfo: nil, repeats: true)
        newTimer.fire()
        
    }
    
    func timerFire(){
        
        _time--
        if(_time != 0){
            
            delegate?.returnTimeAndName(_name, time: self.formatTime(_time))
            self.formatTime(_time)
            
        }else{
            newTimer.invalidate()
        }
        
    }
    
    
    
    func formatTime(totalTimeInSeconds:Int) -> String{
        
        var hours = totalTimeInSeconds / 60 / 60
        var minutes = totalTimeInSeconds / 60 % 60
        var seconds = totalTimeInSeconds % 60
        
        var hoursString = "\(hours)"
        var minutesString = "\(minutes)"
        var secondsString = "\(seconds)"
        
        if(hours < 10){
            hoursString = "0\(hours)"
        }
        if(minutes < 10){
            minutesString = "0\(minutes)"
        }
        if(seconds < 10){
            secondsString = "0\(seconds)"
        }

        return "\(hoursString):\(minutesString):\(secondsString)"
    }
    
       
}
