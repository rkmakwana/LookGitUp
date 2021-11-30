//
//  RepoListPresenterTests.swift
//  LookGitUpTests
//
//  Created by Rashmikant Makwana on 11/30/21.
//

import XCTest
@testable import LookGitUp

class RepoListPresenterTests: XCTestCase {
    var presenter: RepoListPresenterImplementation!
    var worker = MockRepoListWorker()
    var view = MockRepoListView()
    var router = MockRepoListRouter()

    override func setUpWithError() throws {
        presenter = RepoListPresenterImplementation(view: view,
                                                    worker: worker,
                                                    router: router)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_search_success_updates_view() {
        let repos = Repo.createRepoList(count: 3)
        worker.expectedResult = .success(repos)
        presenter.search(for: "query")

        XCTAssertEqual(presenter.numberOfItems, 3, "Incorrect data items")
        XCTAssertTrue(view.listRefreshed, "Unable to refresh view")
        XCTAssertTrue(view.noResultsViewHidden, "Should hide no results view")
    }

    func test_search_success_empty_list_updates_view() {
        let repos = [Repo]()
        worker.expectedResult = .success(repos)
        presenter.search(for: "query")

        XCTAssertFalse(view.noResultsViewHidden, "Should show no results view")
    }

    func test_configures_cell_correctly() {
        let repos = Repo.createRepoList(count: 3)
        presenter.repos = repos
        let cell = MockRepoListItem()
        presenter.configure(cell: cell, at: 1)
        XCTAssertNotNil(cell.expected, "Unable to configure cell")
        XCTAssertEqual(cell.expected.name, "Repo1", "Incorrrect item")
    }

    func test_show_deetails_success() {
        let repos = Repo.createRepoList(count: 3)
        presenter.repos = repos
        presenter.showDetails(index: 1)
        XCTAssertEqual(router.passedRepo.id, repos[1].id, "Showing incorrect details")
    }
}
