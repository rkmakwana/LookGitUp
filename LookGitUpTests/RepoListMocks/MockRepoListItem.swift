//
//  MockRepoListItem.swift
//  LookGitUpTests
//
//  Created by Rashmikant Makwana on 11/30/21.
//

import Foundation
@testable import LookGitUp

class MockRepoListItem: RepoListItemView {
    var expected: Repo!
    func updateItem(with repo: Repo) {
        expected = repo
    }
}
