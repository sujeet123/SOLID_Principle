//
//  File.swift
//  SOLID_Principle
//
//  Created by Sujeet kumar on 14/08/26.
//

import Foundation

// Only responsible for validating input
class LoginValidator: CredentialValidating {
    func validate(_ credentials: LoginCredentials) -> String? {
        if credentials.email.isEmpty { return "Email is required" }
        if !credentials.email.contains("@") { return "Enter a valid email" }
        if credentials.password.count < 6 { return "Password must be at least 6 characters" }
        return nil
    }
}

enum AuthError: Error {
    case invalidResponse
}
