//
//  RepoListConfiguratorImplementation.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/28/21.
//

import Foundation

class RepoListConfiguratorImplementation: RepoListConfigurator {
    func configure(viewController: RepoListViewController) {
        let router = RepoListRouterImplementation(viewController: viewController)
        let worker = RepoListWorkerImplementation()
        let presenter = RepoListPresenterImplementation(view: viewController,
                                                        worker: worker,
                                                        router: router)
        viewController.presenter = presenter
    }
}
