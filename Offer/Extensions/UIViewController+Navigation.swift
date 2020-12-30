//
//  UIViewController+Navigation.swift
//  Offer
//
//  Created by Gabriel A. Dragoni on 28/12/20.
//

import UIKit

extension UIViewController {
    
    func performSegue(withIdentifier enumSegue: EnumSegueProtocol, sender: Any?) {
        performSegue(withIdentifier: enumSegue.rawValue, sender: sender)
    }
}
