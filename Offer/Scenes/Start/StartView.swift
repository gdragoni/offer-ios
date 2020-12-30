//
//  StartView.swift
//  Offer
//
//  Created by Gabriel A. Dragoni on 28/12/20.
//

import UIKit

class StartView: UIViewController {
    lazy var viewModel: StartViewModelProtocol = StartViewModel(view: self)
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.initFlow()
    }
}

extension StartView: StartViewProtocol {
    
    func navigateToMain() {
        performSegue(withIdentifier: SeguesFrom.start.toMain, sender: nil)
    }
    
    func navigateToLogin() {
        performSegue(withIdentifier: SeguesFrom.start.toLogin, sender: nil)
    }
}

protocol StartViewProtocol {
    func navigateToMain()
    func navigateToLogin()
}
