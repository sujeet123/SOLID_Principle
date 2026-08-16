//
//  LoginViewController.swift
//  SOLID_Principle
//
//  Created by Sujeet kumar on 16/08/26.
//

//6. The View — thin, only handles UI (S again)

//The view controller doesn't know about networking, validation rules, or storage. It just binds to the ViewModel's outputs. That's the payoff of S.

import Foundation
import UIKit

class LoginViewController: UIViewController {
    private let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.onLoginSuccess = { [weak self] in
            // navigate to home screen
        }
        viewModel.onLoginFailure = { [weak self] message in
            // show alert with message
        }
    }
    
    @objc private func loginButtonTapped() {
        viewModel.login(email: emailField.text ?? "", password: passwordField.text ?? "")
    }
    
    // emailField, passwordField, loginButton setup omitted for brevity
    private let emailField = UITextField()
    private let passwordField = UITextField()
}
