//
//  primaryProfile.swift
//  ngo-hub-2
//
//  Created by kunwar anirudh singh on 18/11/18.
//  Copyright © 2018 kunwar anirudh singh. All rights reserved.
//

import Foundation


class PrimaryDetails {
    
    var name: String!
    
    var email: String!
    
    var purpose: String!
    
    var description: String!
    
    var country: String!
    
    var state: String!
    
    var city: String!
    
    var primaryPhone: String!
    
    var secondaryPhone: String!
    
    var website: String!
    
    var userImg: UIImage!
    
    init(name: String, email:String, purpose: String, description: String, country: String, state: String, city: String, primaryPhone: String, secondaryPhone: String, website: String, userImg: UIImage){
        
        self.name = name
        self.email = email
        self.purpose = purpose
        self.description = description
        self.country = country
        self.state = state
        self.city = city
        self.primaryPhone = primaryPhone
        self.secondaryPhone = secondaryPhone
        self.website = website
        self.userImg = userImg
    }
    
}
