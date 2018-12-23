//
//  country.swift
//  ngo-hub-2
//
//  Created by kunwar anirudh singh on 04/11/18.
//  Copyright © 2018 kunwar anirudh singh. All rights reserved.
//

import Foundation
class Country {
     var id: Int!
     var name: String!
     var phoneCode: Int!
     var sortName: String!
    
    init(_id: Int, _name: String, _phoneCode: Int, _sortName: String) {
        self.id = _id
        self.name = _name
        self.phoneCode = _phoneCode
        self.sortName = _sortName
    }
    
}

class State {
    var id: String!
    var name: String!
    
    var country_id: String!
    
    init(_id: String, _name: String, _country_id: String) {
        self.id = _id
        self.name = _name
        self.country_id = _country_id
    }
    
}

class City {
    var id: String!
    var name: String!
    var state_id: String!
    init(_id: String, _name: String, _state_id: String) {
        self.id = _id
        self.name = _name
        self.state_id = _state_id
    }
}



struct GlobalVariables{
    static var countryArr : [Country] = []
    static var stateArr: [State] = []
    static var cityArr : [City] = []
}

