//
//  RepoDetailsConfigurator.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/29/21.
//

import Foundation

protocol RepoDetailsConfigurator {
    func configure(viewController: RepoDetailsViewController, repo: Repo)
}
