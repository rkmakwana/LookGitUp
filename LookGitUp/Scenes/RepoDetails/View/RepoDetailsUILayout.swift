//
//  RepoDetailsUILayout.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/29/21.
//

import Foundation
import UIKit

// MARK: - Create UI
extension RepoDetailsViewController {
    // Creating the UI and binding it using loadView() in this file seperately.

    override func loadView() {
        super.loadView()

        view.backgroundColor = .systemBackground
        safeArea = view.layoutMarginsGuide

//        navigationBarAppearance()
    }

    func navigationBarAppearance() {
        self.title = AppConstants.title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.hidesSearchBarWhenScrolling = false
//        navigationController?.navigationBar.barStyle = .default
    }
}
