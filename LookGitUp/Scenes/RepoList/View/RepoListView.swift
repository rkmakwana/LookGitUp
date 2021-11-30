//
//  RepoListView.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/28/21.
//

import Foundation

protocol RepoListView {
    func refreshList()
    func displayError(title: String, message: String)
    func showNoResultsView()
    func hideNoResultsView()
}
