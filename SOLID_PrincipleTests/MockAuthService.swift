//
//  File.swift
//  SOLID_PrincipleTests
//
//  Created by Sujeet kumar on 17/08/26.
//

import Foundation

class MockAuthService: AuthServiceProtocol {
    var result: Result<User, Error> = .success(User(id: 1, name: "Sujeet Kumar", email: "Sujeetkumartiwary@gmail.com", token: "njddkj3o2"))
    func login(with credentials: LoginCredentials, completion: @escaping (Result<User, any Error>) -> Void) {
        completion(result)
    }
}

class MockSessionStore: SessionStoring {
    var savedUser: User?
    func save(user: User) {
        savedUser = user
    }
    
    func clearSession() {
        savedUser = nil
    }
}
