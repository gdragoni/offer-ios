//
//  NavigationController.swift
//  Offer
//
//  Created by Gabriel A. Dragoni on 28/12/20.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        button.setImage(#imageLiteral(resourceName: "arrow-left-white"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(popViewController(animated:)), for: .touchUpInside)
        
        let barItem = UIBarButtonItem(customView: button)
        
        barItem.customView?.heightAnchor.constraint(equalToConstant: 30).isActive = true
        barItem.customView?.widthAnchor.constraint(equalToConstant: 40).isActive = true
        viewController.navigationItem.leftBarButtonItem = barItem
        viewController.navigationItem.leftBarButtonItem?.tintColor = .white
        viewController.navigationItem.rightBarButtonItem?.isEnabled = false
        
        if #available(iOS 12, *) {
            barItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        }
        
        super.pushViewController(viewController, animated: animated)
    }
}
