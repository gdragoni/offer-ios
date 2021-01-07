//
//  HomeTabBarView.swift
//  Offer
//
//  Created by Gabriel Dragoni on 07/01/21.
//

import UIKit

class HomeTabBarView: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTitle()
        configureTabBar()
    }
    
    func configureTabBar() {
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.8745098039, green: 0.6980392157, blue: 0.2, alpha: 1)
    }
    
    func configureTitle() {
        
        let logoImgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        logoImgView.contentMode = .scaleAspectFit
        logoImgView.image = #imageLiteral(resourceName: "offer-logo")
        navigationItem.titleView = logoImgView
    }
}
