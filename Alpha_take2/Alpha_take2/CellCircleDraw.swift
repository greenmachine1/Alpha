//
//  CellCircleDraw.swift
//  Alpha_take2
//
//  Created by Cory Green on 3/26/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

class CellCircleDraw: UIView {
    
    var circleCreateView:UIView = UIView()
    var percentageOfCircle:CGFloat?
    
    var _normalColor:UIColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
    var _midPointColor:UIColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
    var _threeForthsDoneColor:UIColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
    
    var _nameOfEvent:String = ""
    var _timeInSeconds:Int = 0
    var _numberOfRepeats:Int = 0
    var _timeInBetweenRepeats:Int = 0
    var _literalTime:String = "00:00:00"
    var _countUpOrDown:Bool = false
    
    var mainLabel:UILabel = UILabel()
    var timeLabel:UILabel = UILabel()
    var numberOfRepeatsLabel:UILabel = UILabel()
    var timeOfRepeatsLabel:UILabel = UILabel()
    
    var count:Int = 0
    var newTimer:NSTimer?
    

    func initialize(callingView:UIView){
        
        circleCreateView.frame = CGRectMake(0.0, 0.0, callingView.frame.width, callingView.frame.height)
        circleCreateView.backgroundColor = UIColor.clearColor()
        
        

        mainLabel = UILabel(frame: CGRectMake(0.0, 0.0, circleCreateView.frame.width - 10.0, 20.0))
        mainLabel.center = CGPointMake(circleCreateView.frame.width / 2, circleCreateView.frame.height / 3)
        mainLabel.text = _nameOfEvent
        mainLabel.textAlignment = .Center
        mainLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
        
        timeLabel = UILabel(frame: CGRectMake(0.0, 0.0, circleCreateView.frame.width - 10.0, 20.0))
        timeLabel.center = CGPointMake(circleCreateView.frame.width / 2, circleCreateView.frame.height / 2 + mainLabel.frame.height)
        timeLabel.text = _literalTime
        timeLabel.textAlignment = .Center
        timeLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
        
        numberOfRepeatsLabel = UILabel(frame: CGRectMake(circleCreateView.frame.origin.x, circleCreateView.frame.origin.y + circleCreateView.frame.height - 20.0, 20.0, 20.0))
        numberOfRepeatsLabel.text = "\(_numberOfRepeats)"
        numberOfRepeatsLabel.textAlignment = .Left
        numberOfRepeatsLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
        
        timeOfRepeatsLabel = UILabel(frame: CGRectMake(circleCreateView.frame.origin.x + circleCreateView.frame.width - 40.0, circleCreateView.frame.origin.y + circleCreateView.frame.height - 20.0, 40.0, 20.0))
        timeOfRepeatsLabel.text = "\(_timeInBetweenRepeats)"
        timeOfRepeatsLabel.textAlignment = .Right
        timeOfRepeatsLabel.textColor = ColorPallete.sharedInstance.deepBlueColor

        circleCreateView.addSubview(mainLabel)
        circleCreateView.addSubview(timeLabel)
        circleCreateView.addSubview(numberOfRepeatsLabel)
        circleCreateView.addSubview(timeOfRepeatsLabel)
        
        
        callingView.addSubview(circleCreateView)
        
    }
    
    
    



}
