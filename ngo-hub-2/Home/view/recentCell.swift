//
//  recentCell1.swift
//  ngo-hub
//
//  Created by HIMALAYA  RAJPUT on 20/10/18.
//  Copyright © 2018 infroid. All rights reserved.
//

import UIKit

class recentCell: UITableViewCell {
    
    var request : Request!{
        didSet{
            titleLabel.text = request.title
            descLabel.text = request.description
            userImageView.image = request.image
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    
    
    @IBOutlet weak var userImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
