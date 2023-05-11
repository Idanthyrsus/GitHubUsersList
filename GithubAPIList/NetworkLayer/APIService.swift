//
//  APIService.swift
//  GithubAPIList
//
//  Created by Alexander Korchak on 11.05.2023.
//

import Foundation
import Combine

private enum CustomError: Error {
    case badUrl
    case wrongQueiry
}


class APIService {
    static let shared = APIService()
    
    init() { }
    
    func fetchUsers(perPage: Int = 30, sinceId: Int? = nil) -> AnyPublisher<[User], Error> {
     
        let urlString = "https://api.github.com/users"
        
        var components = URLComponents(string: urlString)
        
        components?.queryItems = [
            URLQueryItem(name: "per_page", value: "\(perPage)"),
            URLQueryItem(name: "since", value: (sinceId != nil) ? "\(sinceId!)" : nil)
        ]
        
        guard let url = components?.url else {
            return Fail(error: CustomError.badUrl).eraseToAnyPublisher()
        }
        
        let request = URLRequest(url: url, timeoutInterval: 5)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: [User].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
