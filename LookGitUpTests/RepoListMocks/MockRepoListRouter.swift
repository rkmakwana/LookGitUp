//
//  MockRepoListRouter.swift
//  LookGitUpTests
//
//  Created by Rashmikant Makwana on 11/30/21.
//

import Foundation
@testable import LookGitUp

class MockRepoListRouter: RepoListRouter {
    var passedRepo: Repo!

    func showDetails(for repo: Repo) {
        passedRepo = repo
    }
}
