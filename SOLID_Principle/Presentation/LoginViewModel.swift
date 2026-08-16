//
//  LoginViewModel.swift
//  SOLID_Principle
//
//  Created by Sujeet kumar on 14/08/26.
//

import Foundation
import Combine


//5. The ViewModel — depends only on abstractions

//The ViewModel has no idea whether it's talking to a real API or a mock, real Keychain or fake storage, standard or enterprise validation. It just trusts the contracts (L — any conforming implementation must behave consistently, e.g. authService.login must always eventually call its completion, exactly once, with success or failure — never silently hang or crash).

final class LoginViewModel: ObservableObject {
    private let authService: AuthServiceProtocol
    private let sessionStore: SessionStoring
    private let validator: CredentialValidating

    var onLoginSuccess: ( () -> Void )?
    var onLoginFailure: ( (String) -> Void )?
    
    init(authService: AuthServiceProtocol, sessionStore: SessionStoring, validator: CredentialValidating) {
        self.authService = authService
        self.sessionStore = sessionStore
        self.validator = validator
    }
  
    func login(email: String, password: String) {
        let credentails = LoginCredentials(email: email, password: password)
        
        if let validationError = validator.validate(credentails) {
            onLoginFailure?(validationError)
        }
        
        authService.login(with: credentails) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    self.sessionStore.save(user: user)
                    self.onLoginSuccess?()
                case .failure(let error):
                    self.onLoginFailure?("Login failed. Please try again.")
                }
            }
        }
    }
}
