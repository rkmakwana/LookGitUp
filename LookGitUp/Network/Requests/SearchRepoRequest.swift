//
//  SearchRepoRequest.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/29/21.
//

import Foundation

struct SearchRepoResponse: Codable {
    let items: [Repo]
}

struct SearchRepoRequest: APIEndpoint, Codable {
    var query: String

    func endpoint() -> String {
        var url = Endpoints.fetchResults
        url.append("?q=\(query)")
        return url
    }

    func dispatch(completion: @escaping ((Result<SearchRepoResponse, Error>) -> Void)) {
        NetworkClient.get(request: self,
                          completion: completion)
    }
}
