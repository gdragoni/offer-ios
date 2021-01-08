//
//  Market.swift
//  Offer
//
//  Created by Gabriel Dragoni on 08/01/21.
//

import Foundation

extension DataRequest {
    
    @discardableResult
    func responseMarketList(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<[Market]>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}

struct Market: Codable {
    let name, logo, address: String?
    let type: Int?
    let latitude, longitude, distance: Double?
}
