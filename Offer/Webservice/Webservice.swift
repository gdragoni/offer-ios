//
//  Webservice.swift
//  Offer
//
//  Created by Gabriel Dragoni on 30/12/20.
//

import Foundation
import Alamofire

class WebService {
    
    static private var headers: HTTPHeaders {
        get {
            if let authBearer = Session.current.authBearer {
                return ["Authorization": "Bearer \(authBearer)"]
            }
            return [:]
        }
    }
    
    static func run(service: APIService, method: HTTPMethod = .post, parameters: [String:Any] = [:], encoding: ParameterEncoding = URLEncoding.default) -> DataRequest {
        let url = API.fullPath(for: service)

        #if DEBUG
        print("URL: \(url)\nMethod: \(method.rawValue)\nHeaders: \(headers)\nParameters: \n")
        parameters.printJSON()
        #endif
        
        return Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
        .responseString(completionHandler: { completion in
            #if DEBUG
            if  let data = completion.data,
                let JSONString = String(data: data, encoding: String.Encoding.utf8) {
                print(JSONString)
            }
            #endif
        })
            .validateSession(service: service)
            .validate(statusCode: 200...300)
    }
    
    static func validate(statusCode: HTTPStatusCode) {
        if statusCode == .unauthorized {
            Session.current.clearAuthBearer()
            let viewController = UIStoryboard (name: "Start", bundle: Bundle.main).instantiateInitialViewController()
            let keyWindow = UIApplication.shared.connectedScenes
                    .filter({$0.activationState == .foregroundActive})
                    .map({$0 as? UIWindowScene})
                    .compactMap({$0})
                    .first?.windows
                    .filter({$0.isKeyWindow}).first
            keyWindow?.rootViewController = viewController
            viewController?.alert(message: "Sua sessão expirou")
        }
    }
    
    static var isConnectedToInternet: Bool {
        if let networkManager = NetworkReachabilityManager() {
            return networkManager.isReachable
        }
        return false
    }
}

extension DataRequest {
    
    @discardableResult
    func validateSession(service: APIService) -> Self {
        return response( completionHandler: { completion in
            switch service {
            case .login:
                return
            default:
                WebService.validate(statusCode: completion.response?.status ?? .undefined)
            }
        })
    }
}

extension DownloadRequest {
    
    @discardableResult
    func validateSession() -> Self {
        return response( completionHandler: { completion in
            WebService.validate(statusCode: completion.response?.status ?? .undefined)
        })
    }
}
