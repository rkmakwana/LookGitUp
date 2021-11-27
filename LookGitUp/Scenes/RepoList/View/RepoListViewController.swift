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
