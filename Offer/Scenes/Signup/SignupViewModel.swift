//
//  SignupViewModel.swift
//  Offer
//
//  Created by Gabriel Dragoni on 30/12/20.
//

import Foundation

class SignupViewModel: SignupViewModelProtocol {
    var view: SignupViewProtocol!
    
    init(view: SignupViewProtocol) {
        self.view = view
    }
    
    func doRegister(fullname: String, email: String, password: String) {
        let request = RegisterRequest(name: fullname, email: email, password: password)
        WebService.run(service: .register, parameters: request.dictionary ?? [:]).responseDefault(completionHandler: { [weak self] completion in
            switch completion.result {
            case .success(_):
                self?.view.showSuccessAndBack()
            case .failure(let error):
                self?.view.showError(msg: error.localizedDescription)
            }
        })
    }
}

protocol SignupViewModelProtocol {
    
    func doRegister(fullname: String, email: String, password: String)
}
