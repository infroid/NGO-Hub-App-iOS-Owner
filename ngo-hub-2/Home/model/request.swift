//
//  request.swift
//  ngo-hub-2
//
//  Created by kunwar anirudh singh on 18/11/18.
//  Copyright © 2018 kunwar anirudh singh. All rights reserved.
//

import Foundation

class Request {
    var title: String!
    var description: String!
    var image: UIImage!
    
    init(title: String, description: String, image: UIImage) {
        self.title = title
        self.description = description
        self.image = image
    }
}
