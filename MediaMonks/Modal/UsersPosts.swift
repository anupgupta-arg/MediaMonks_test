//
//  UsersPosts.swift
//  MediaMonks
//
//  Created by Anup Gupta on 09/05/21.
//

import Foundation

// MARK: - UsersPost
struct UsersPost: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias UsersPosts = [UsersPost]
