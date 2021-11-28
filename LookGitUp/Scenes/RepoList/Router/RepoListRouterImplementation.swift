//
//  RepoListRouterImplementation.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/28/21.
//

import Foundation

class RepoListRouterImplementation: RepoListRouter {
    private weak var viewController: RepoListViewController?
//    private var news: News!

    init(viewController: RepoListViewController) {
        self.viewController = viewController
//        self.listViewController?.navigationController?.delegate = self
    }

//    func presentDetailsView(for item: News, cell: NewsItemView) {
//        self.news = item
//
//     contactDetailViewController.configurator = ContactDetailConfiguratorImplementation(contact: contact,
//                                                                                           delegate: detailDelegate)
//        contactListViewController?.performSegue(withIdentifier: Constants.SegueIdentifiers.showDetails, sender: nil)
//    }
}
