//
//  RepoDetailsPresenter.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/29/21.
//

import Foundation

protocol RepoDetailsPresenter {
    var repoName: String { get }
    var userName: String { get }
    var stars: String { get }
    var language: String { get }
    var languageColor: String { get }
    var createdOn: String { get }
    var repoDesc: String? { get }
    var avatarURL: URL? { get }
    var isLiked: Bool { get }
    var isDisliked: Bool { get }

    func viewDidLoad()
    func changedLikeStatus()
    func changedDislikeStatus()
}
