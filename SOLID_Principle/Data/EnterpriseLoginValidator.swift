//
//  EnterpriseLoginValidator.swift
//  SOLID_Principle
//
//  Created by Sujeet kumar on 14/08/26.
//

//4. Extending validation without modifying it (O — Open/Closed)
//
//Say later you need stricter password rules for enterprise accounts. You don't edit LoginValidator — you add a new type:

import Foundation

class EnterpriseLoginValidator: CredentialValidating {
    func validate(_ credentials: LoginCredentials) -> String? {
        if credentials.email.isEmpty { return "Email is required" }
                if !credentials.email.hasSuffix("@company.com") { return "Use your company email" }
                if credentials.password.count < 12 { return "Enterprise passwords must be at least 12 characters" }
                return nil
    }    
}
