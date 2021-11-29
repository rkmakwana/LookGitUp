//
//  RepoListPresenter.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/28/21.
//

import Foundation

protocol RepoListPresenter {
    var numberOfItems: Int { get }
    func configure(cell: RepoListItemView, at index: Int)
    func search(for key: String)
    func showDetails(index: Int)
}
