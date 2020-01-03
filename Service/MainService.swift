//
//  MainService.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 02/01/2020.
//  Copyright © 2020 Aymeric Vanderkelen. All rights reserved.
//

import Foundation

struct MainService {
    
    static func formatDate(date: Date) -> String {
        let french = DateFormatter()
        french.dateStyle = .medium
        french.timeStyle = .medium
        french.locale    = Locale(identifier: "FR-fr")
        return french.string(from: date)
    }
}
