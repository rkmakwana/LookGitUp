//
//  RepoListRouterImplementation.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/28/21.
//

import Foundation

class RepoListRouterImplementation: RepoListRouter {
    private weak var viewController: RepoListViewController?

    init(viewController: RepoListViewController) {
        self.viewController = viewController
    }

    func showDetails(for repo: Repo) {
        let detailconfigurator = RepoDetailsConfiguratorImplementation()
        let detailsViewController = RepoDetailsViewController()
        detailconfigurator.configure(viewController: detailsViewController,
                                     repo: repo)
        viewController?.show(detailsViewController, sender: nil)
    }
}
