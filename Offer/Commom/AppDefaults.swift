//
//  AppDefaults.swift
//  Offer
//
//  Created by Gabriel A. Dragoni on 28/12/20.
//

import Foundation

class AppDefaults {
    
    static private var enviroments: NSDictionary {
        let enviromentsDict = NSDictionary(dictionary: Bundle.main.infoDictionary!).value(forKey: "Enviroment") as! NSDictionary
        return enviromentsDict
    }
    
    static func envValue(for option: EnvOptions) -> String {
        return enviroments.value(forKey: option.rawValue) as! String
    }
}

enum EnvOptions: String {
    case sessionKeychainIdentifier = "SESSION_KEYCHAIN_IDENTIFIER"
    case apiBaseURL = "API_BASE_URL"
}
