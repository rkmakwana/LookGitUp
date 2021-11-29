//
//  RepoDetailsConfiguratorImplementation.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/29/21.
//

import Foundation

class RepoDetailsConfiguratorImplementation: RepoDetailsConfigurator {
    func configure(viewController: RepoDetailsViewController, repo: Repo) {
        let worker = RepoDetailsWorkerImplementation()
        let presenter = RepoDetailsPresenterImplementation(view: viewController,
                                                           worker: worker,
                                                           repo: repo)
        viewController.presenter = presenter
    }
}
