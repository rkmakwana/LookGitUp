//
//  MockRepoListView.swift
//  LookGitUpTests
//
//  Created by Rashmikant Makwana on 11/30/21.
//

import Foundation
@testable import LookGitUp

class MockRepoListView: RepoListView {
    var listRefreshed = false
    var errorMessage = ""
    var noResultsViewHidden = false

    func refreshList() {
        listRefreshed = true
    }

    func displayError(title: String, message: String) {
        errorMessage = message
    }

    func showNoResultsView() {
        noResultsViewHidden = false
    }

    func hideNoResultsView() {
        noResultsViewHidden = true
    }
}
