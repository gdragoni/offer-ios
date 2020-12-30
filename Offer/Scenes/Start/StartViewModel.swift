//
//  StartViewModel.swift
//  Offer
//
//  Created by Gabriel A. Dragoni on 28/12/20.
//

import Foundation

class StartViewModel: StartViewModelProtocol {
    var view: StartViewProtocol!
    
    init(view: StartViewProtocol) {
        self.view = view
    }
    
    func initFlow() {
        if Session.current.logged {
            view.navigateToMain()
        } else {
            view.navigateToLogin()
        }
    }
}

protocol StartViewModelProtocol {
    func initFlow()
}
