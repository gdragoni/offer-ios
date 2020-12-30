//
//  LoginView.swift
//  Offer
//
//  Created by Gabriel A. Dragoni on 28/12/20.
//

import UIKit

class LoginView: UIViewController {
    @IBOutlet var emailTxtField: UITextField!
    @IBOutlet var passwordTxtField: UITextField!
    @IBOutlet var loadingButtonView: LoadingButtonView!
    
    lazy var viewModel: LoginViewModelProtocol = LoginViewModel(view: self)
    
    @IBAction func loginDidTapped() {
        let email = emailTxtField.text ?? ""
        let password = passwordTxtField.text ?? ""
        if(email.isEmpty || password.isEmpty) {
            alert(message: "Os campos usuário e senha são de preenchimento obrigatório!")
        } else {
            loadingButtonView.showLoading()
            viewModel.doLogin(email: email, password: password)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension LoginView: LoginViewProtocol {
    
    func navigateToMain() {
        loadingButtonView.hiddenLoading()
        performSegue(withIdentifier: SeguesFrom.login.toMain, sender: nil)
    }
    
    func showError(msg: String) {
        loadingButtonView.hiddenLoading()
        alert(message: msg)
    }
}

protocol LoginViewProtocol: class {
    func navigateToMain()
    func showError(msg: String)
}
