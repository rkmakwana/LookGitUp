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

    init(view: RepoDetailsView,
         worker: RepoDetailsWorker,
         repo: Repo) {
        self.view = view
        self.worker = worker
        self.repo = repo
    }
}
