//
//  API.swift
//  Offer
//
//  Created by Gabriel A. Dragoni on 28/12/20.
//

import Foundation

class API {
    static private let baseURL: String = AppDefaults.envValue(for: .apiBaseURL)
    
    static public func fullPath(for service: APIService) -> String { return "\(baseURL)\(service.path)" }
}

enum APIService {
    case login
    case register
    case loja(Double, Double, Int)
}

protocol Path {
    var path: String { get }
}

extension APIService : Path {
    var path: String {
        switch self {
        case .login:
            return "/user/login"
        case .register:
            return "/user/register"
        case .loja(let latitude,
                   let longitude,
                   let range):
            return "/loja?latitude=\(latitude)&longitude=\(longitude)&range=\(range)"
        }
    }
}

struct DefaultResponse: Codable {
    let message: String?
}

extension DataRequest {
    
    @discardableResult
    func responseDefault(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<DefaultResponse>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
