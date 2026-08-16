//
//  User.swift
//  SOLID_Principle
//
//  Created by Sujeet kumar on 13/08/26.
//

import Foundation

struct User: Decodable {
    let id: Int
    let name: String?
    let email: String
    let token: String
}
