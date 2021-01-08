//
//  MapView.swift
//  Offer
//
//  Created by Gabriel Dragoni on 07/01/21.
//

import UIKit
import MapKit

class MapView: UIViewController {
    @IBOutlet var mapView: MKMapView!
    
    lazy var viewModel: MapViewModelProtocol = MapViewModel(mapView: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rioClaroLocation = ["latitude" : -22.403258, "longitude" : -47.565620]
        viewModel.loadPins(latitude: rioClaroLocation["latitude"]!, longitude: rioClaroLocation["longitude"]!)
    }
}

extension MapView: MapViewProtocol {
    
    func configure(mapPinViewModels: [MapPinViewModel]) {
        mapView.addAnnotations(mapPinViewModels.map({ pin in
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2DMake(pin.latitude, pin.longigutde)
            annotation.title = pin.title
            return annotation
        }))
    }
    
    func showError(msg: String) {
        alert(message: msg)
    }
}

extension MapView: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !annotation.isKind(of: MKUserLocation.self) else {
            return nil
        }

        let annotationIdentifier = "AnnotationIdentifier"

        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView!.canShowCallout = true
        }
        else {
            annotationView!.annotation = annotation
        }

        annotationView!.image = #imageLiteral(resourceName: "5")
        annotationView!.largeContentTitle = "Teste"

        return annotationView
    }
}

protocol MapViewProtocol: class {
    
    func configure(mapPinViewModels: [MapPinViewModel])
    func showError(msg: String)
}
