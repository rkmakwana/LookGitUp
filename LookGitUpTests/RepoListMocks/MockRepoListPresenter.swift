//
//  MockRepoListPresenter.swift
//  LookGitUpTests
//
//  Created by Rashmikant Makwana on 11/30/21.
//

import Foundation
@testable import LookGitUp

class MockRepoListPresenter: RepoListPresenter {
    var expectedNumberOfItems: Int!
    var numberOfItems: Int {
        expectedNumberOfItems
    }

    func configure(cell: RepoListItemView, at index: Int) { }

    func search(for key: String) { }

    func showDetails(index: Int) { }
}
