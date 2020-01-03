//
//  Sensor.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 02/01/2020.
//  Copyright © 2020 Aymeric Vanderkelen. All rights reserved.
//

import Foundation

struct Sensor : Codable, Identifiable {
    
    var id: Int = -1
    var name: String? = ""
    var type: String? = ""
    var token: String? = ""
    var room_id: Int? = -1
    var url: String? = ""
    var types: [SensorType]? = nil
    var infos: SensorInformation? = nil
    
    mutating func Init(){
        self.id = -1
        self.name = ""
        self.type = ""
        self.token = ""
        self.room_id = -1
        self.url = ""
        self.types = nil
        self.infos = nil
    }
    
}
