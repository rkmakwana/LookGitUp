//
//  RepoListUILayout.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/28/21.
//

import Foundation
import UIKit

// MARK: - Create UI
extension RepoListViewController {
    // Creating the UI and binding it using loadView() in this file seperately.

    override func loadView() {
        super.loadView()

        view.backgroundColor = .systemBackground
        safeArea = view.layoutMarginsGuide

        navigationBarAppearance()
        setuptableView()
        setupSearchControl()
//        setupNoResultsView()
    }

    func navigationBarAppearance() {
        self.title = AppConstants.title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.hidesSearchBarWhenScrolling = false
//        navigationController?.navigationBar.barStyle = .default
    }

    func setuptableView() {
        tableView = UITableView()

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ]
        NSLayoutConstraint.activate(constraints)

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(RepoListTableCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView()
    }

    func setupSearchControl() {
        searchController = UISearchController()
        searchController.searchBar.searchBarStyle = .prominent
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
    }

    func setupNoResultsView() {
        let container = UIView()
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [
            container.topAnchor.constraint(equalTo: safeArea.topAnchor),
            container.leftAnchor.constraint(equalTo: view.leftAnchor),
            container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            container.rightAnchor.constraint(equalTo: view.rightAnchor)
        ]
        NSLayoutConstraint.activate(constraints)

        let iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.image = UIImage(named: ImageNames.githubIcon)
        container.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        constraints = [
            iconImageView.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: -20),
            iconImageView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 40),
            iconImageView.heightAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(constraints)

        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: ImageNames.lookingup)
        container.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        constraints = [
            imageView.bottomAnchor.constraint(equalTo: iconImageView.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: iconImageView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 160),
            imageView.heightAnchor.constraint(equalToConstant: 120)
        ]
        NSLayoutConstraint.activate(constraints)

        noResultsView = container
    }
}
