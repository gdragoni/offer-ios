//
//  Register.swift
//  Offer
//
//  Created by Gabriel Dragoni on 30/12/20.
//

import Foundation

struct RegisterRequest: Codable {
    let name, email, password: String?
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
}
