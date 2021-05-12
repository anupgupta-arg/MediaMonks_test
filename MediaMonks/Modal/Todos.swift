//
//  Todos.swift
//  MediaMonks
//
//  Created by Anup Gupta on 13/05/21.
//

import Foundation

// MARK: - Todo
struct Todo: Codable {
    let userID, id: Int?
    let title: String?
    let completed: Bool?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}

typealias Todos = [Todo]
