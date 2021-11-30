//
//  MockRepoDetailsWorker.swift
//  LookGitUpTests
//
//  Created by Rashmikant Makwana on 11/30/21.
//

import Foundation
@testable import LookGitUp

class MockRepoDetailsWorker: RepoDetailsWorker {
    var repoId: Int!
    var liked = false
    var disliked = false

    var shouldThrow = false

    func getLikeStatus(repoId: Int) throws -> (liked: Bool, disliked: Bool) {
        if shouldThrow {
            throw NSError()
        }
        return (liked, disliked)
    }

    func setLikeStatus(repoId: Int, liked: Bool, disliked: Bool) throws {
        if shouldThrow {
            throw NSError()
        }
        self.repoId = repoId
        self.liked = liked
        self.disliked = disliked
    }
}
