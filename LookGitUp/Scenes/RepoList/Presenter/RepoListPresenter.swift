//
//  RepoListPresenter.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/28/21.
//

import Foundation

protocol RepoListPresenter {
    var numberOfItems: Int { get }
//    func select(cell: NewsItemView, for indexPath: IndexPath)
    func configure(cell: RepoListItemView, at index: Int)
//    func setSearch(active: Bool)
    func search(for key: String)
}
