//
//  File.swift
//  SOLID_Principle
//
//  Created by Sujeet kumar on 14/08/26.
//

//3. Concrete implementations (S — Single Responsibility)
//
//Each class does exactly one thing.

import Foundation

// Only responsible for hitting the network and decoding
class AuthService: AuthServiceProtocol {
    let url: String

    init(url: String) {
        self.url = url
    }

    func login(
        with credentials: LoginCredentials,
        completion: @escaping (Result<User, any Error>) -> Void
    ) {
        guard let urlRequest = makeUrlRequest(url: url) else {
            completion(.failure(APIError.inValidURLError))
            return
        }

        URLSession.shared.dataTask(with: urlRequest) {
            data,
            urlResponse,
            error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                completion(.failure(APIError.inValidResponseError))
                return

            }

            guard let data = data else {
                completion(.failure(APIError.inValidResponseError))
                return
            }

                switch httpResponse.statusCode {
                case 200...299:
                        do {
                            let user = try JSONDecoder().decode(User.self, from: data)
                            completion(.success(user))
                        } catch {
                            completion(.failure(error))
                        }
                case 400...499:
                    completion(
                        .failure(APIError.clientError(statusCode: httpResponse.statusCode))
                    )
                case 500...599:
                    completion(
                        .failure(APIError.serverError(statusCode: httpResponse.statusCode))
                    )
                default:
                    completion(.failure(APIError.otherError(message: "")))
                }
        }.resume()
    }

    private func makeUrlRequest(url: String) -> URLRequest? {
        guard let url = URL(string: url) else { return nil }
        return URLRequest(url: url)
    }
}
