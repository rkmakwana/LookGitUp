//
//  RepoListWorkerTest.swift
//  LookGitUpTests
//
//  Created by Rashmikant Makwana on 11/30/21.
//

import XCTest
@testable import LookGitUp

class RepoListWorkerTest: XCTestCase {
    let worker = RepoListWorkerImplementation()

    override func setUpWithError() throws {
    }

    func test_fetch_search_request() {
        let url = URL(string: "\(Endpoints.fetchResults))?q=k")
        // swiftlint:disable line_length
        let expectedData = """
            {"items":[
            {"owner":{"login":"supercrabtree","avatar_url":""},"stargazers_count":1575,"id":17423038,"created_at":"2014-03-05T00:53:47Z","language":"Shell","full_name":"supercrabtree/k","description":"k is the new l, yo"}
            ]}
            """
        // swiftlint:enable line_length
        URLProtocolMock.testURLs = [url: Data(expectedData.utf8)]

        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        _ = URLSession(configuration: config)

        let expectation = self.expectation(description: "query")
        worker.getSearchResults(searchQuery: "k") { result in
            guard case .success(let repos) = result else {
                return XCTFail("Expected success but got an error")
            }
            expectation.fulfill()
            XCTAssertEqual(repos.first!.id, 17423038, "Incorrect data")
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
