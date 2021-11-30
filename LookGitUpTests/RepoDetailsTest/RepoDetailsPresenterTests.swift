//
//  RepoDetailsPresenterTests.swift
//  LookGitUpTests
//
//  Created by Rashmikant Makwana on 11/30/21.
//

import XCTest
@testable import LookGitUp

class RepoDetailsPresenterTests: XCTestCase {
    var presenter: RepoDetailsPresenterImplementation!
    var worker = MockRepoDetailsWorker()
    var view = MockRepoDetailsView()
    let repo = Repo.createSingleRepo()

    override func setUpWithError() throws {
        presenter = RepoDetailsPresenterImplementation(view: view,
                                                       worker: worker,
                                                       repo: repo)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_viewDidLoad_updates_view() {
        presenter.viewDidLoad()
        XCTAssertTrue(view.didSetDetails, "Unable to set details")
        XCTAssertTrue(view.didSetLikeDislike, "Unable to set like and dislike")
    }

    func test_like_action() {
        presenter.liked = false
        presenter.changedLikeStatus()

        XCTAssertTrue(presenter.isLiked, "Incorrect behaviour")
        XCTAssertFalse(presenter.isDisliked, "Incorrect behaviour")
        XCTAssertTrue(worker.liked, "Unable to save to db")
        XCTAssertEqual(worker.repoId, presenter.repo.id, "Saving incorrect object")
    }

    func test_dislike_action() {
        presenter.disliked = false
        presenter.changedDislikeStatus()

        XCTAssertTrue(presenter.isDisliked, "Incorrect behaviour")
        XCTAssertFalse(presenter.isLiked, "Incorrect behaviour")
        XCTAssertTrue(worker.disliked, "Unable to save to db")
        XCTAssertEqual(worker.repoId, presenter.repo.id, "Saving incorrect object")
    }

    func test_db_exception_like() {
        worker.shouldThrow = true
        presenter.changedLikeStatus()

        XCTAssertEqual(view.errorMessage, ErrorMessages.likeDislikeFailed)
    }

    func test_db_exception_dislike() {
        worker.shouldThrow = true
        presenter.changedDislikeStatus()

        XCTAssertEqual(view.errorMessage, ErrorMessages.likeDislikeFailed)
    }

    func test_list_configures_details_correctly() {
        let router = RepoListRouterImplementation(viewController: RepoListViewController())
        let listPresenter = RepoListPresenterImplementation(view: MockRepoListView(),
                                                            worker: MockRepoListWorker(),
                                                            router: router)
        listPresenter.repos = Repo.createRepoList(count: 4)
        listPresenter.showDetails(index: 1)
        XCTAssertEqual(presenter.repo.id, 1, "Passed incorrect data")
    }

    func test_language_color() {
        XCTAssertEqual(presenter.languageColor, "#0b84e8")
    }
}
