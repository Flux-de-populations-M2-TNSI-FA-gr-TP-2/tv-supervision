//
//  Event.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 18/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//

import Foundation

struct Event : Codable, Identifiable {
    
    var id: Int = -1
    var name: String
    var start: Date
    var end: Date
    var status: String
    var event_groups : [Group]?
    
    init(){
        self.id = -1
        self.name = ""
        self.start = Date()
        self.end = Date()
        self.status = ""
        self.event_groups = nil
    }
    init(id: Int, name: String, start: Date, end: Date, status: String, event_groups: [Group]){
        self.id = id
        self.name = name
        self.start = start
        self.end = end
        self.status = status
        self.event_groups = event_groups
    }
    
    
}
