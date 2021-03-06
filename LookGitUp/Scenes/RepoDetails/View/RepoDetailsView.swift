//
//  RepoDetailsView.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/29/21.
//

import Foundation

protocol RepoDetailsView {
    func setDetails()
    func setLikeDislike()
    func displayAlert(title: String, message: String)
}
