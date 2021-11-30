//
//  MockRepoListWorker.swift
//  LookGitUpTests
//
//  Created by Rashmikant Makwana on 11/30/21.
//

import Foundation
@testable import LookGitUp

class MockRepoListWorker: RepoListWorker {
    var expectedResult: Result<[Repo], Error>!

    func getSearchResults(searchQuery: String, completion: @escaping ((Result<[Repo], Error>) -> Void)) {
        completion(expectedResult)
    }
}
