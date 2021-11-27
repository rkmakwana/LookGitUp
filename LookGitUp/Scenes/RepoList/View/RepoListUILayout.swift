//
//  RepoListUILayout.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/28/21.
//

import Foundation
import UIKit

// MARK:- Create UI
extension RepoListViewController {
    
    // No storyboard or xib used, keeping the view controller lean.
    // Creating the UI and binding it using loadView() in this file seperately.
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        
        navigationBarAppearance()
        setuptableView()
//        setupSearchControl()
        setupNoFeedsView()
        setupLoader()
    }
    
    func navigationBarAppearance() {
        self.title = "Search Github"
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = .systemGreen
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        } else {
            navigationController?.navigationBar.barTintColor = .systemGreen
            navigationController?.navigationBar.tintColor = .white
            navigationController?.navigationBar.isTranslucent = false
            navigationItem.title = title
        }
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = .white
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
        
//        tableView.dataSource = self
//        tableView.delegate = self
//
//        tableView.register(NewsItemCollectionCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
//        tableView.backgroundColor = AppColors.secondaryBackground
    }
    
    func setupLoader() {
        if #available(iOS 13.0, *) {
            loader = UIActivityIndicatorView(style: .large)
        } else {
            loader = UIActivityIndicatorView(style: .gray)
        }
        loader.center = self.view.center
        loader.hidesWhenStopped = true
        view.addSubview(loader)
    }
    
    func setupSearchControl() {
        searchController = UISearchController()
        searchController.searchBar.searchBarStyle = .prominent
        searchController.searchBar.tintColor = .white
        navigationItem.searchController = searchController
//        searchController.searchResultsUpdater = self
//        searchController.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    func setupNoFeedsView() {
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
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
//        imageView.image = UIImage(named: ImageNames.noRecords)
        container.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        constraints = [
            imageView.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.5),
            imageView.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: -60),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(constraints)
        
        let label = UILabel()
        label.text = "No results found"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .systemPink
        container.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        constraints = [
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 46))
        button.setTitle("Try again", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.showsTouchWhenHighlighted = true
//        button.addTarget(self, action: #selector(retry(_:)), for: .touchUpInside)
        container.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        constraints = [
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: label.centerXAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        
        noResultsView = container
        noResultsView.isHidden = true
    }
    
}

