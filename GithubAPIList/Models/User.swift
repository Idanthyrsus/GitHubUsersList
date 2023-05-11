//
//  User.swift
//  GithubAPIList
//
//  Created by Alexander Korchak on 11.05.2023.
//

import Foundation

struct User: Decodable {
    let id: Int
    let name: String
    let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "login"
        case avatarUrl = "avatar_url"
    }
}
