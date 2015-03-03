//
//  CustomCellTableViewCell.swift
//  Alpha_take2
//
//  Created by Cory Green on 3/2/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var mainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
