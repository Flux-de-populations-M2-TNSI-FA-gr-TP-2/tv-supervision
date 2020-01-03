//
//  SensorType.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 02/01/2020.
//  Copyright © 2020 Aymeric Vanderkelen. All rights reserved.
//

import Foundation

struct SensorType : Codable, Identifiable {
    
    var id: Int = -1
    var name: String? = ""
    var unity: String? = ""
}
