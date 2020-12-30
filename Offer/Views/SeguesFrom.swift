//
//  SeguesFrom.swift
//  Offer
//
//  Created by Gabriel A. Dragoni on 28/12/20.
//

import Foundation

class SeguesFrom {
    enum start: String, EnumSegueProtocol {
        case toLogin = "toLogin"
        case toMain = "toMain"
    }
    
    enum login: String, EnumSegueProtocol {
        case toMain = "toMain"
    }
}

protocol EnumSegueProtocol {
    var rawValue: String { get }
}
