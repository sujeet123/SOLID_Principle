//
//  AuthServiceProtocol.swift
//  SOLID_Principle
//
//  Created by Sujeet kumar on 13/08/26.
//

// 2. Abstractions first (D — Dependency Inversion)

// Instead of the ViewModel talking directly to URLSession, it depends on protocols.
//This is the foundation everything else plugs into.

import Foundation


// Networking abstraction
protocol AuthServiceProtocol {
    func login(with credentials: LoginCredentials, completion: @escaping (Result<User, Error>) -> Void)
}

// Persistence abstraction — kept separate from AuthService (I — Interface Segregation)
protocol SessionStoring {
    func save(user: User)
    func clearSession()
}

// Validation abstraction — also separate, single-purpose (I)
protocol CredentialValidating {
    func validate(_ credentials: LoginCredentials) -> String?  // returns error message, or nil if valid
}
