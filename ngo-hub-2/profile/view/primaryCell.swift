//
//  primaryCell.swift
//  ngo-hub-2
//
//  Created by kunwar anirudh singh on 01/11/18.
//  Copyright © 2018 kunwar anirudh singh. All rights reserved.
//

import UIKit



class primaryCell: UITableViewCell  {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var purposeLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var primaryPhoneLabel: UILabel!
    
    @IBOutlet weak var secondaryPhoneLabel: UILabel!
    
    @IBOutlet weak var websiteLabel: UILabel!
    
    @IBOutlet weak var userImgView: UIImageView!{
        didSet{
            self.userImgView.contentMode = .scaleAspectFit
            self.userImgView.clipsToBounds = true
            self.userImgView.isUserInteractionEnabled = true
            
        }
    }
    
    
    var primaryDetails: PrimaryDetails!{
        didSet{
            nameLabel.text = primaryDetails.name
            emailLabel.text = primaryDetails.email
            purposeLabel.text = primaryDetails.purpose
            descriptionLabel.text = primaryDetails.description
            countryLabel.text = primaryDetails.country
            stateLabel.text = primaryDetails.state
            cityLabel.text = primaryDetails.city
            primaryPhoneLabel.text = primaryDetails.primaryPhone
            secondaryPhoneLabel.text = primaryDetails.secondaryPhone
            websiteLabel.text = primaryDetails.website
            userImgView.image = primaryDetails.userImg
        }
    }
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
