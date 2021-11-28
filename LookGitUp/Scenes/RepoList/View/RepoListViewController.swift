//
//  RepoListViewController.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/28/21.
//

import UIKit

class RepoListViewController: UIViewController, RepoListView {
    var presenter: RepoListPresenter!

    var tableView: UITableView!
    var noResultsView: UIView!
    var loader: UIActivityIndicatorView!
    var safeArea: UILayoutGuide!
    var searchController: UISearchController!

    let cellIdentifier = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }

}

extension RepoListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
//        return presenter.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? RepoListTableCell else {
            fatalError("Unable to dequeue table cell")
        }
        return cell
    }

}

extension RepoListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("START SEARCHING BHIDU")
    }
}
