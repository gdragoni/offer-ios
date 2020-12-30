//
//  Login.swift
//  Offer
//
//  Created by Gabriel Dragoni on 30/12/20.
//

import Foundation

struct LoginResponse: Codable {
    let id, name, password, email, token: String?
}

extension DataRequest {
    
    @discardableResult
    func responseLogin(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<LoginResponse>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}

struct LoginRequest: Codable {
    let login, password: String?
    
    init(email: String, password: String) {
        self.login = email
        self.password = password
    }
}
