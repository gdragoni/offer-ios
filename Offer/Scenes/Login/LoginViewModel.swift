//
//  LoginViewModel.swift
//  Offer
//
//  Created by Gabriel A. Dragoni on 28/12/20.
//

import Foundation

class LoginViewModel: LoginViewModelProtocol {
    var view: LoginViewProtocol!
    
    init(view: LoginViewProtocol) {
        self.view = view
    }
    
    func doLogin(username: String, password: String) {
        
    }
}

protocol LoginViewModelProtocol {
    func doLogin(username: String, password: String)
}
