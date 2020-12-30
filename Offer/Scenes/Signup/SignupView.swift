//
//  SignupView.swift
//  Offer
//
//  Created by Gabriel A. Dragoni on 28/12/20.
//

import UIKit

class SignupView: UIViewController {
    @IBOutlet var fullnameTxtField: UITextField!
    @IBOutlet var emailTxtField: UITextField!
    @IBOutlet var passwordTxtField: UITextField!
    @IBOutlet var repeatPasswordTxtField: UITextField!
    @IBOutlet var loadingButtonView: LoadingButtonView!
    
    lazy var viewModel: SignupViewModelProtocol = SignupViewModel(view: self)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func registerDidTapped() {
        let fullname = fullnameTxtField.text ?? ""
        let email = emailTxtField.text ?? ""
        let password = passwordTxtField.text ?? ""
        let repeatPassword = repeatPasswordTxtField.text ?? ""
        
        if email.isEmpty || password.isEmpty || repeatPassword.isEmpty || fullname.isEmpty {
           alert(message: "Preencha todos os campos para continuar!")
        } else if !email.isEmail() {
            alert(message: "E-mail digitado é inválido! Confirme se digitou o e-mail corretamente")
        } else if password != repeatPassword {
            alert(message: "Senhas diferentes! Confirme se digitou a senha corretamente!")
        } else if password.count < 8 {
            alert(message: "A senha deve ter no mínimo 8 caracteres!")
        } else {
            loadingButtonView.showLoading()
            viewModel.doRegister(fullname: fullname, email: email, password: password)
        }
    }
}

extension SignupView: SignupViewProtocol {
    
    func showSuccessAndBack() {
        loadingButtonView.hiddenLoading()
        alert(message: "Criado com sucesso!") { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    func showError(msg: String) {
        loadingButtonView.hiddenLoading()
        alert(message: msg)
    }
}

protocol SignupViewProtocol {
    func showSuccessAndBack()
    func showError(msg: String)
}
