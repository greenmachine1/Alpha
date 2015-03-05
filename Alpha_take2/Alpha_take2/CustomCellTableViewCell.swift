//
//  CustomCellTableViewCell.swift
//  Alpha_take2
//
//  Created by Cory Green on 3/2/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

@objc protocol ReturnEventName{
    
    func returnEventName(nameOfEvent:String)
    
}

class CustomCellTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var leftPicture: UIImageView!
    @IBOutlet weak var eventNameTextField: UITextField!
    
    var color:ColorPallete = ColorPallete()
    
    var delegate:ReturnEventName?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        eventNameTextField.delegate = self
        eventNameTextField.layer.borderColor = color.darkGreenColor.CGColor
        eventNameTextField.layer.borderWidth = 1.0
        eventNameTextField.layer.cornerRadius = 5.0
        eventNameTextField.clipsToBounds = true
    
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        // returning the event name //
        delegate?.returnEventName(textField.text)
        textField.resignFirstResponder()
        return true
    }
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
