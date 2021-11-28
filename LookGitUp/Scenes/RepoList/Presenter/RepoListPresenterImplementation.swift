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
    var repos = [Repo]()

    init(view: RepoListView, worker: RepoListWorker, router: RepoListRouter) {
        self.view = view
        self.worker = worker
        self.router = router
    }

    var numberOfItems: Int {
        repos.count
    }

    func configure(cell: RepoListItemView, at index: Int) {
        cell.updateItem(with: repos[index])
    }

    func search(for key: String) {
        worker.getSearchResults(searchQuery: key) { [weak self] result in
            switch result {
            case .success(let repos):
                self?.repos = repos
                self?.view.refreshList()
            case .failure(let error):
                self?.view.displayError(title: "Error",
                                        message: "\(ErrorMessages.searchFailed) - \(error.localizedDescription)")
            }
        }
    }
}
