//
//  volunteerCell.swift
//  ngo-hub-2
//
//  Created by kunwar anirudh singh on 26/10/18.
//  Copyright © 2018 kunwar anirudh singh. All rights reserved.
//

import UIKit

class volunteerCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
