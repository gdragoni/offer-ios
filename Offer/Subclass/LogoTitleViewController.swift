//
//  LogoTitleViewController.swift
//  Offer
//
//  Created by Gabriel Dragoni on 07/01/21.
//

import UIKit

class LogoTitleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logoImgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        logoImgView.contentMode = .scaleAspectFit
        logoImgView.image = #imageLiteral(resourceName: "offer-logo")
        navigationItem.titleView = logoImgView
    }
}
