//
//  Login.swift
//  Vender
//
//  Created by Emincan on 7.01.2023.
//

import UIKit
import RxCocoa
import RxSwift


protocol LoginSuccesfullInterface {
    func routeToTabbar()
}

class LoginViewController: UIViewController {
    
    private let loginViewModel = LoginViewModel()
    private let disposeBag = DisposeBag()
    
    private  var stackView = UIStackView()
    private  var loginB =  UIButton()
    private  var passwordTextF = UITextField()
    private  var mailTextField = UITextField()

    var delagate: LoginSuccesfullInterface?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        rxSwiftFuncs()
        
    }
    
    
    
    private func style() {
        
        view.backgroundColor = .orange
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.layer.cornerRadius = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        mailTextField.placeholder = "Enter email"
        mailTextField.layer.cornerRadius = 5
        passwordTextF.placeholder = "Password"
        passwordTextF.isSecureTextEntry = true
        passwordTextF.layer.cornerRadius = 5

        loginB.setTitle("Login", for: .normal)
        loginB.setTitle("Not Enough", for: .disabled)
        loginB.contentHorizontalAlignment = .center
        loginB.layer.borderWidth = 5
        loginB.layer.borderColor = .init(red: 20, green: 20, blue: 20, alpha: 1)
        loginB.addTarget(self, action: #selector(loginBtnPressed), for: .touchUpInside)
        loginB.layer.cornerRadius = 5
       
        
        
    }
    private func layout() {
        stackView.addArrangedSubview(mailTextField)
        stackView.addArrangedSubview(passwordTextF)
        stackView.addArrangedSubview(loginB)
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2)
        ])
        
    }
    
    private func rxSwiftFuncs() {
        mailTextField.becomeFirstResponder()
        
        mailTextField.rx.text.map {$0 ?? ""}.bind(to:loginViewModel.mailtextPublishSubject).disposed(by: disposeBag)
        passwordTextF.rx.text.map {$0 ?? ""}.bind(to:loginViewModel.passwordTextPublishSubject).disposed(by: disposeBag)
        loginViewModel.isValid().bind(to: loginB.rx.isEnabled).disposed(by: disposeBag)
        loginViewModel.isValid().map {$0 ? 1: 0.1 }.bind(to: loginB.rx.alpha).disposed(by: disposeBag)
        
    }
    
    
    
   @objc private func loginBtnPressed() {
        // login devam sayfaya
       delagate?.routeToTabbar()
    }
}


