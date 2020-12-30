//
//  LoginView.swift
//  Offer
//
//  Created by Gabriel A. Dragoni on 28/12/20.
//

import UIKit

class LoginView: UIViewController {
    @IBOutlet var usernameTxtField: UITextField!
    @IBOutlet var passwordTxtField: UITextField!
    
    lazy var viewModel: LoginViewModelProtocol = LoginViewModel(view: self)
    
    @IBAction func loginDidTapped() {
        let username = usernameTxtField.text ?? ""
        let password = passwordTxtField.text ?? ""
        if(username.isEmpty || password.isEmpty) {
            alert(message: "Os campos usuário e senha são de preenchimento obrigatório!")
        } else {
            viewModel.doLogin(username: username, password: password)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension LoginView: LoginViewProtocol {
    
    func navigateToMain() {
        performSegue(withIdentifier: SeguesFrom.login.toMain, sender: nil)
    }
}

protocol LoginViewProtocol: class {
    func navigateToMain()
}
