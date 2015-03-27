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

    func initialize(callingView:UIView, nameOfEvent:String){
        
        circleCreateView.frame = CGRectMake(0.0, 0.0, callingView.frame.width, callingView.frame.height)
        circleCreateView.backgroundColor = UIColor.clearColor()
        
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: circleCreateView.frame.width / 2, y: circleCreateView.frame.height / 2), radius: (circleCreateView.frame.size.width - 10.0) / 2, startAngle: 0.0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
        
        circleShape = CAShapeLayer()
        circleShape!.path = circlePath.CGPath
        circleShape!.fillColor = UIColor.clearColor().CGColor
        circleShape!.strokeColor = UIColor.redColor().CGColor
        circleShape!.lineWidth = 5.0
        circleShape!.strokeEnd = 0.0
        
        
        
        var mainLabel:UILabel = UILabel(frame: CGRectMake(0.0, 0.0, circleCreateView.frame.width - 10.0, 20.0))
        mainLabel.center = circleCreateView.center
        mainLabel.text = "00:00:00"
        mainLabel.textAlignment = .Center
        mainLabel.textColor = ColorPallete.sharedInstance.deepBlueColor
        
        
        
        
        circleCreateView.layer.addSublayer(circleShape)
        circleCreateView.addSubview(mainLabel)
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
