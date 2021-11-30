//
//  MockRepoDetailsView.swift
//  LookGitUpTests
//
//  Created by Rashmikant Makwana on 11/30/21.
//

import Foundation
@testable import LookGitUp

class MockRepoDetailsView: RepoDetailsView {
    var didSetDetails = false
    var didSetLikeDislike = false
    var errorMessage = ""

    func setDetails() {
        didSetDetails = true
    }

    func setLikeDislike() {
        didSetLikeDislike = true
    }

    func displayAlert(title: String, message: String) {
        errorMessage = message
    }
}
