//
//  Repo.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/29/21.
//

import Foundation
import UIKit

struct Repo: Codable {
    let id: Int
    let name: String
    let language: String?
    let stars: Int

    enum CodingKeys: String, CodingKey {
        case id
        case name = "full_name"
        case language
        case stars = "stargazers_count"
    }

    func languageColor() -> UIColor {
        guard let lang = self.language else {
            return .black
        }
        var total: Int = 5 // Initialised with 5 just to get good looking color sets. Totally random! :)
        for uni in lang.unicodeScalars {
            total += Int(UInt32(uni))
        }
        srand48(total * 200)
        let red = CGFloat(drand48())
        srand48(total)
        let green = CGFloat(drand48())
        srand48(total / 200)
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}
