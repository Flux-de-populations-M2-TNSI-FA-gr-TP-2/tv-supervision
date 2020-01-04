//
//  Information.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 04/01/2020.
//  Copyright © 2020 Aymeric Vanderkelen. All rights reserved.
//

import Foundation

struct Information : Codable {

    var users: Int
    var event_groups: Int
    var events: Int
    var locations: Int
    var rooms: Int
    var sensors: Int
    var sensor_types: Int
    
    init(){
        self.users = -1
        self.event_groups = -1
        self.events = -1
        self.locations = -1
        self.rooms = -1
        self.sensors = -1
        self.sensor_types = -1
    }
}
