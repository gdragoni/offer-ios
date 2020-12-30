//
//  Alamofire+Codable.swift
//  Offer
//
//  Created by Gabriel Dragoni on 30/12/20.
//

import Foundation
import Alamofire

public typealias DataRequest = Alamofire.DataRequest
public typealias DataResponse = Alamofire.DataResponse
public typealias HTTPMethod = Alamofire.HTTPMethod

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

extension DataRequest {
    func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else {
                let decoder = JSONDecoder()
                if  let data = data,
                    let decoded = try? decoder.decode(DefaultResponse.self, from: data) {
                    return .failure(NSError(domain: "", code: 99, userInfo: [
                                                NSLocalizedDescriptionKey : decoded.message ?? error?.localizedDescription ?? "Ocorreu um erro"
                    ]))
                }
                return .failure(error!)
            }
            
            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }
            
            return Result { try newJSONDecoder().decode(T.self, from: data) }
        }
    }
    
    @discardableResult
    func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }
}
