//
//  RepoDetailsWorker.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/29/21.
//

import Foundation

protocol RepoDetailsWorker {
    func getLikeStatus(repoId: Int) throws -> (liked: Bool, disliked: Bool)
    func setLikeStatus(repoId: Int, liked: Bool, disliked: Bool) throws
}
