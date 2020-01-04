//
//  User.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 12/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//

import Foundation

class User : Codable, Identifiable {
    
    var id: Int = -1
    var firstname :String? = ""
    var lastname :String? = ""
    var email :String = ""
    var password :String = ""
    var role: String = ""
    
    init(id: Int, firstname: String, lastname: String, email: String, password: String, role: String){
        self.id = id
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = password
        self.role = role
    }
    
}

