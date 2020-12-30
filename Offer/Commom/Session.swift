//
//  Session.swift
//  Offer
//
//  Created by Gabriel A. Dragoni on 28/12/20.
//

import Foundation
import Valet

class Session {
    static let current = Session()
    
    private let keychain: Valet = Valet.valet(with: Identifier(nonEmpty: AppDefaults.envValue(for: .sessionKeychainIdentifier))!, accessibility: .alwaysThisDeviceOnly)

    var logged: Bool {
        return authBearer != nil
    }
    
    func save(authBearer: String) {
        keychain.set(string: authBearer, forKey: SessionFlags.authBearer.rawValue)
    }
    
    func clearAuthBearer() {
        keychain.removeObject(forKey: SessionFlags.authBearer.rawValue)
    }
    
    var authBearer: String? {
        return keychain.string(forKey: SessionFlags.authBearer.rawValue)
    }
    
    private enum SessionFlags: String {
        case authBearer = "AUTH_BEARER"
    }
}
