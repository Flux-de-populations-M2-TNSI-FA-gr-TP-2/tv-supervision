//
//  Group.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 18/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//

import Foundation

struct Group : Codable, Identifiable {
    
    var id: Int = -1
    var name: String = ""
    var restriction: String? = nil
    
    init(id : Int, name: String, restriction: String){
        self.id = id
        self.name = name
        self.restriction = restriction
    }
}
