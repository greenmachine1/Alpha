//
//  ColorSchemeCell.swift
//  Alpha_take2
//
//  Created by Cory Green on 3/2/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

class ColorSchemeCell: UITableViewCell {

    @IBOutlet weak var thirdColorImageView: UIImageView!
    @IBOutlet weak var secondColorImageView: UIImageView!
    @IBOutlet weak var firstColorImageView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
