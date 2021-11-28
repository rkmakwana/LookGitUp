//
//  RepoListPresenterImplementation.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/28/21.
//

import Foundation

class RepoListPresenterImplementation: RepoListPresenter {
    let view: RepoListView
    let worker: RepoListWorker
    let router: RepoListRouter
//    var newsList = [News]()

    init(view: RepoListView, worker: RepoListWorker, router: RepoListRouter) {
        self.view = view
        self.worker = worker
        self.router = router
    }

    var numberOfItems: Int {
        0
    }

    func viewDidLoad() {
        print("LOL I am loaded")
    }
}
