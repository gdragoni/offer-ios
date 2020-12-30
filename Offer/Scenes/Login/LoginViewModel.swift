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
    
    func doLogin(email: String, password: String) {
        let request = LoginRequest(email: email, password: password)
        WebService.run(service: .login, parameters: request.dictionary ?? [:]).responseLogin(completionHandler: { [weak self] completion in
            switch(completion.result) {
            case .success(let response):
                if let authBearer = response.token {
                    Session.current.save(authBearer: authBearer)
                    self?.view.navigateToMain()
                } else {
                    self?.view.showError(msg: "Ocorreu um erro ao tentar fazer login")
                }
            case.failure(let error):
                self?.view.showError(msg: error.localizedDescription)
            }
        })
    }
}

protocol LoginViewModelProtocol {
    func doLogin(email: String, password: String)
}
