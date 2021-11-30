//
//  RepoListWorkerImplementation.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/28/21.
//

import Foundation

class RepoListWorkerImplementation: RepoListWorker {
    func getSearchResults(searchQuery: String,
                          completion: @escaping ((Result<[Repo], Error>) -> Void)) {
        SearchRepoRequest(query: searchQuery).dispatch { result in
            switch result {
            case .success(let response):
                completion(.success(response.items))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
