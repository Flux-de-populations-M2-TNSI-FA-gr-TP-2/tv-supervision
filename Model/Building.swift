//
//  Building.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 16/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//

import Foundation


struct Building : Codable {
    
    var id : Int = -1
    var name : String = ""
    var address : String = ""
    var image : String = ""
    var rooms : Array<Room>? = []
    
    init(id: Int, name: String, address: String, image: String){
        self.name = name
        self.address = address
        self.image = image
    }
    
    init(id: Int, name: String, address: String, image: String, rooms : Array<Room>){
        self.name = name
        self.address = address
        self.image = image
        self.rooms = rooms
    }
    
}
