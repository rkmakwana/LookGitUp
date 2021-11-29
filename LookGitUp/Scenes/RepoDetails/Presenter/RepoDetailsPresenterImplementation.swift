//
//  RepoDetailsPresenterImplementation.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/29/21.
//

import Foundation

class RepoDetailsPresenterImplementation: RepoDetailsPresenter {
    let view: RepoDetailsView
    let worker: RepoDetailsWorker
    let repo: Repo

    var liked = false
    var disliked = false

    init(view: RepoDetailsView,
         worker: RepoDetailsWorker,
         repo: Repo) {
        self.view = view
        self.worker = worker
        self.repo = repo
    }

    var repoName: String {
        repo.name
    }

    var userName: String {
        repo.owner.login
    }

    var stars: String {
        String(repo.stars)
    }

    var language: String {
        repo.language ?? ""
    }

    var languageColor: String {
        repo.languageColor()
    }

    var repoDesc: String? {
        repo.description
    }

    var createdOn: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss'Z'"
        guard let date = dateFormatter.date(from: repo.createdAt) else {
            return ""
        }
        dateFormatter.dateFormat = "MMMM dd, YYYY"
        return dateFormatter.string(from: date)
    }

    var avatarURL: URL? {
        guard let urlStr = repo.owner.avatarURL else { return nil }
        return URL(string: urlStr)
    }

    var isLiked: Bool {
        liked
    }

    var isDisliked: Bool {
        disliked
    }

    func viewDidLoad() {
        view.setDetails()
        view.setLikeDislike()
    }

    func changedLikeStatus() {
        liked.toggle()
        disliked = false
        view.setLikeDislike()
    }

    func changedDislikeStatus() {
        disliked.toggle()
        liked = false
        view.setLikeDislike()
    }
}
