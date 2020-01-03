//
//  SensorInformation.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 02/01/2020.
//  Copyright © 2020 Aymeric Vanderkelen. All rights reserved.
//

import Foundation

struct SensorInformation : Codable {
    
    var motion: Bool?
    var tamper: Bool?
    var temperature: String?
    var luminance: String?
    var wakeUpInterval: Int?
    var batteryLevel: Int?
    var on: Bool?
    
}
