//
//  ColorPallete.swift
//  Alpha_take2
//
//  Created by Cory Green on 3/10/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import Foundation
import UIKit

class ColorPallete{
    
    var whiteColor:UIColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    var lightBlueColor:UIColor = UIColor(red: 0.431, green: 0.808, blue: 0.933, alpha: 1.0)
    var greenColor:UIColor = UIColor(red: 0.192, green: 0.733, blue: 0.855, alpha: 1.0)
    var darkGreenColor:UIColor = UIColor(red: 0.075, green: 0.467, blue: 0.557, alpha: 1.0)
    var redColor:UIColor = UIColor(red: 0.553, green: 0.220, blue: 0.118, alpha: 1.0)
    var orangeColor:UIColor = UIColor(red: 0.855, green: 0.435, blue: 0.18, alpha: 1.0)
    var deepBlueColor:UIColor = UIColor(red: 0.0, green: 0.478, blue: 1.0, alpha: 1.0)
    
    
    class var sharedInstance: ColorPallete{
        
        struct Static{
            
            static let instance:ColorPallete = ColorPallete()
            
        }
        return Static.instance
    }
}