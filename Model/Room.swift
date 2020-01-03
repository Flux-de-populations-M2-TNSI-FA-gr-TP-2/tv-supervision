//
//  Room.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 17/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//

import Foundation


struct Room : Codable, Identifiable {
    
    var id : Int = -1
    var name : String = ""
    var floor : String = ""
    var location_id : Int? = 0
    var sensors : [Sensor]? = []
    
    init(id : Int, name : String, floor: String, location_id : Int) {
        self.id = id
        self.name = name
        self.floor = floor
        self.location_id = location_id
    }
    
    
}
