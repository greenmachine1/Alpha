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
    var circleShape:CAShapeLayer?
    
    var _normalColor:UIColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
    var _midPointColor:UIColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
    var _threeForthsDoneColor:UIColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
    
    var _nameOfEvent:String = ""
    var _timeInSeconds:Int = 0
    var _numberOfRepeats:Int = 0
    var _timeInBetweenRepeats:Int = 0
    var _literalTime:String = "00:00:00"
    

    func initialize(callingView:UIView, nameOfEvent:String){
        
        circleCreateView.frame = CGRectMake(0.0, 0.0, callingView.frame.width, callingView.frame.height)
        circleCreateView.backgroundColor = UIColor.clearColor()
        
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: circleCreateView.frame.width / 2, y: circleCreateView.frame.height / 2), radius: (circleCreateView.frame.size.width - 10.0) / 2, startAngle: 0.0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
        
        circleShape = CAShapeLayer()
        circleShape!.path = circlePath.CGPath
        circleShape!.fillColor = UIColor.clearColor().CGColor
        circleShape!.strokeColor = _normalColor.CGColor
        circleShape!.lineWidth = 5.0
        circleShape!.strokeEnd = 0.0
        
        
        
        var mainLabel:UILabel = UILabel(frame: CGRectMake(0.0, 0.0, circleCreateView.frame.width - 10.0, 20.0))
        mainLabel.center = CGPointMake(circleCreateView.frame.width / 2, circleCreateView.frame.height / 3)
        mainLabel.text = _nameOfEvent
        mainLabel.textAlignment = .Center
        mainLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
        
        var timeLabel:UILabel = UILabel(frame: CGRectMake(0.0, 0.0, circleCreateView.frame.width - 10.0, 20.0))
        timeLabel.center = CGPointMake(circleCreateView.frame.width / 2, circleCreateView.frame.height / 2 + mainLabel.frame.height)
        timeLabel.text = _literalTime
        timeLabel.textAlignment = .Center
        timeLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
        
        var numberOfRepeatsLabel:UILabel = UILabel(frame: CGRectMake(circleCreateView.frame.origin.x, circleCreateView.frame.origin.y + circleCreateView.frame.height - 20.0, 20.0, 20.0))
        numberOfRepeatsLabel.text = "\(_numberOfRepeats)"
        numberOfRepeatsLabel.textAlignment = .Left
        numberOfRepeatsLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
        
        var timeOfRepeatsLabel:UILabel = UILabel(frame: CGRectMake(circleCreateView.frame.origin.x + circleCreateView.frame.width - 40.0, circleCreateView.frame.origin.y + circleCreateView.frame.height - 20.0, 40.0, 20.0))
        timeOfRepeatsLabel.text = "\(_timeInBetweenRepeats)"
        timeOfRepeatsLabel.textAlignment = .Right
        timeOfRepeatsLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
        
        
        
        circleCreateView.layer.addSublayer(circleShape)
        circleCreateView.addSubview(mainLabel)
        circleCreateView.addSubview(timeLabel)
        circleCreateView.addSubview(numberOfRepeatsLabel)
        circleCreateView.addSubview(timeOfRepeatsLabel)
        
        self.animateCircle()
        
        callingView.addSubview(circleCreateView)
    }
    
    
    func animateCircle(){
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        
        // the duration is the actual time from the timer //
        animation.duration = 20.0
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        circleShape!.strokeEnd = 1.0
        circleShape!.addAnimation(animation, forKey: "animateCircle")
    }
    
    
    // update the circle //
    func updateCircle(circleTime:CGFloat){
        
        percentageOfCircle = circleTime
        
    }

}
