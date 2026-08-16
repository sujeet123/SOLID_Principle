//
//  APIError.swift
//  SOLID_Principle
//
//  Created by Sujeet kumar on 14/08/26.
//

import Foundation

enum APIError: Error {
    case serverError(statusCode: Int)
    case clientError(statusCode: Int)
    case inValidURLError
    case otherError(message: String)
    case inValidResponseError
}
