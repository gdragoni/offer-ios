//
//  MapPinViewModel.swift
//  Offer
//
//  Created by Gabriel Dragoni on 08/01/21.
//

import UIKit

class MapPinViewModel {
    let type: PinType!
    let title: String?
    let latitude, longigutde: Double!
    
    init(market: Market) {
        self.title = market.name
        self.type = PinType(rawValue: market.type ?? 1) ?? .market
        self.latitude = market.latitude
        self.longigutde = market.longitude
    }
    
    enum PinType: Int {
        case market = 1
        case opened24Hours = 2
        case coffee = 3
        case fastfood = 4
        case shop = 5
        case restaurant = 6
        case pub = 7
        case gasStation = 8
        case cheap = 9
        case health = 10
        
        func icon() -> UIImage {
            switch self {
            case .market:
                return #imageLiteral(resourceName: "1")
            case .opened24Hours:
                return #imageLiteral(resourceName: "2")
            case .coffee:
                return #imageLiteral(resourceName: "3")
            case .fastfood:
                return #imageLiteral(resourceName: "4")
            case .shop:
                return #imageLiteral(resourceName: "5")
            case .restaurant:
                return #imageLiteral(resourceName: "6")
            case .pub:
                return #imageLiteral(resourceName: "7")
            case .gasStation:
                return #imageLiteral(resourceName: "8")
            case .cheap:
                return #imageLiteral(resourceName: "9")
            case .health:
                return #imageLiteral(resourceName: "10")
            }
        }
    }
}


