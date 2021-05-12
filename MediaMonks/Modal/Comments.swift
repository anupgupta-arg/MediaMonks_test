//
//  Comments.swift
//  MediaMonks
//
//  Created by Anup Gupta on 12/05/21.
//

import Foundation

// MARK: - Comment
struct Comment: Codable {
    let postID, id: Int?
    let name, email, body: String?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}

typealias Comments = [Comment]
