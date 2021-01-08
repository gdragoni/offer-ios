//
//  MapViewModel.swift
//  Offer
//
//  Created by Gabriel Dragoni on 08/01/21.
//

import Foundation

class MapViewModel: MapViewModelProtocol {
    let mapView: MapViewProtocol!
    
    init(mapView: MapViewProtocol) {
        self.mapView = mapView
    }
    
    func loadPins(latitude: Double, longitude: Double) {
        WebService.run(service: .loja(latitude, longitude, 20), method: .get).responseMarketList(completionHandler: { [weak self] completion in
            switch completion.result {
            case .success(let markets):
                self?.mapView.configure(mapPinViewModels: markets.map({ MapPinViewModel(market: $0) }))
            case .failure(let error):
                self?.mapView.showError(msg: error.localizedDescription)
            }
        })
    }
}

protocol MapViewModelProtocol {
    
    func loadPins(latitude: Double, longitude: Double)
}
