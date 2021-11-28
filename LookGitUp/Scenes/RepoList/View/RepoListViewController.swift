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
    }

    func refreshList() {
        tableView.reloadData()
    }

    func displayError(title: String, message: String) {
        self.showAlert(title: title,
                       message: message)
    }
}

extension RepoListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? RepoListTableCell else {
            fatalError("Unable to dequeue table cell")
        }
        presenter.configure(cell: cell, at: indexPath.row)
        return cell
    }

}

extension RepoListViewController: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let key = searchController.searchBar.text, !key.isEmpty else { return }
        presenter.search(for: key)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let key = searchBar.text else { return }
        presenter.search(for: key)
        searchController.dismiss(animated: true, completion: nil)
    }
}
