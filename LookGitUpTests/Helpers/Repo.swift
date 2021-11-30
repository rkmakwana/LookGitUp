//
//  Repo.swift
//  LookGitUpTests
//
//  Created by Rashmikant Makwana on 11/30/21.
//

import Foundation
@testable import LookGitUp

extension Repo {
    static func createSingleRepo(language: String = "java") -> Repo {
        return Repo(id: 1,
                    name: "Repo1",
                    language: language,
                    stars: 21,
                    description: "Some desc1",
                    createdAt: "2011-08-15T21:27:11Z",
                    owner: Owner(login: "Owner1",
                                 avatarURL: "https://avatarurl.com"))
    }

    static func createRepoList(count: Int) -> [Repo] {
        var repos = [Repo]()
        for item in 0..<count {
            let repo = Repo(id: item,
                            name: "Repo\(item)",
                            language: "php",
                            stars: count*item,
                            description: "Some desc\(item)",
                            createdAt: "2011-08-15T21:27:11Z",
                            owner: Owner(login: "Owner\(item)",
                                         avatarURL: "https://avatarurl.com"))
            repos.append(repo)
        }
        return repos
    }
}
