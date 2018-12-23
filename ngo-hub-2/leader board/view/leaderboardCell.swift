//
//  leaderboardCell.swift
//  ngo-hub-2
//
//  Created by kunwar anirudh singh on 01/12/18.
//  Copyright © 2018 kunwar anirudh singh. All rights reserved.
//

import UIKit

class leaderboardCell: UITableViewCell {

    
    var request : Request!{
        didSet{
            ngoName.text = request.title
            ngoImageView.image = request.image
            ngoMemberLabel.text = "Members : " + "\(generateRandomNumber(min: 100, max: 5000))"
            ngoContributionLabel.text = "Contributions : " + "\(generateRandomNumber(min: 100, max: 5000))"
        }
    }
    
    func generateRandomNumber(min: Int, max: Int) -> Int {
        let randomNum = Int(arc4random_uniform(UInt32(max) - UInt32(min)) + UInt32(min))
        return randomNum
    }
    
    @IBOutlet weak var ngoImageView: UIImageView!
    @IBOutlet weak var ngoName: UILabel!
    @IBOutlet weak var ngoMemberLabel: UILabel!
    @IBOutlet weak var ngoContributionLabel: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
