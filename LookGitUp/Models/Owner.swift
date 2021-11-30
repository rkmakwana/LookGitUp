//
//  Owner.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/30/21.
//

import Foundation

struct Owner: Codable {
    let login: String
    let avatarURL: String?

    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}
