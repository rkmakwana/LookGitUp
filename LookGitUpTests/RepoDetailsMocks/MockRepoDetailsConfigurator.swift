//
//  MockRepoDetailsConfigurator.swift
//  LookGitUpTests
//
//  Created by Rashmikant Makwana on 11/30/21.
//

import Foundation
@testable import LookGitUp

class MockRepoDetailsConfigurator: RepoDetailsConfigurator {
    var repo: Repo!

    func configure(viewController: RepoDetailsViewController, repo: Repo) {
        self.repo = repo
    }
}
