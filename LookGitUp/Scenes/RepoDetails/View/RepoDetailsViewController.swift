//
//  RepoDetailsViewController.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/29/21.
//

import UIKit

class RepoDetailsViewController: UIViewController {
    var presenter: RepoDetailsPresenter!

    var safeArea: UILayoutGuide!

    @UsesAutoLayout
    var userImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.layer.cornerRadius = 30.0
        imgView.backgroundColor = .systemGroupedBackground
        return imgView
    }()

    @UsesAutoLayout
    var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.cellSubtitleLbl
        label.textColor = UIColor.label
        return label
    }()

    @UsesAutoLayout
    var repoNameLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.cellTitleLbl
        label.textColor = UIColor.label
        label.text = "Unknown"
        label.numberOfLines = 2
        return label
    }()

    @UsesAutoLayout
    var starsLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.cellSecondaryLbl
        label.textColor = UIColor.secondaryLabel
        label.text = "0"
        return label
    }()

    @UsesAutoLayout
    var languageLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.cellSubtitleLbl
        label.textColor = UIColor.tertiaryLabel
        label.text = "Unspecified"
        return label
    }()

    @UsesAutoLayout
    var languageBullet: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5.0
        view.layer.masksToBounds = true
        return view
    }()

    @UsesAutoLayout
    var repoDescLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.cellSecondaryLbl
        label.textColor = UIColor.label
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension RepoDetailsViewController: RepoDetailsView {

}
