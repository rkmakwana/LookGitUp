//
//  RepoListWorker.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/28/21.
//

import Foundation

protocol RepoListWorker {
    func getSearchResults(searchQuery: String, completion: @escaping ((Result<[Repo], Error>) -> Void))
}
