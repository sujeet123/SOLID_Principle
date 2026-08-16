//
//  KeychainSessionStore.swift
//  SOLID_Principle
//
//  Created by Sujeet kumar on 14/08/26.
//

import Foundation

// Only responsible for storing session data
class KeychainSessionStore: SessionStoring {
    func save(user: User) {
        // save token to Keychain
    }
    
    func clearSession() {
        // clear Keychain
    }
}
