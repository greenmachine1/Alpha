//
//  TimerObject.swift
//  Alpha_take2
//
//  Created by Cory Green on 2/25/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

@objc protocol ReturnTime{
    
    func returnTimeAndName(#personName:String, additionOrSubtraction:Bool)
    
}

class TimerObject: NSObject {
    
    var _personName:String?
    var _additionOrSubtracion:Bool?
    var delegate:ReturnTime?
   
    override init(){
        super.init()
    }
    
    init(personName:String, additionOrSubtraction:Bool) {
        super.init()
        
        _personName = personName
        _additionOrSubtracion = additionOrSubtraction
        
        self.startTimer()
    }
    
    func startTimer(){
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "timerMethod", userInfo: nil, repeats: true)
        timer.fire()
        
    }
    
    func timerMethod(){
        
        println("fired!")
        
    }
    
}
