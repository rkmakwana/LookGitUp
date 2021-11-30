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
    var userImageView: CachedImageView = {
        let imgView = CachedImageView()
        imgView.layer.cornerRadius = 40.0
        imgView.backgroundColor = .tertiarySystemFill
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFill
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
        label.font = AppFonts.largeTitleLbl
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
    var creationDateLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.italicLbl
        label.textColor = UIColor.secondaryLabel
        label.text = "June 04, 2022"
        return label
    }()

    @UsesAutoLayout
    var repoDescLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.cellSecondaryLbl
        label.textColor = UIColor.label
        label.numberOfLines = 0
        return label
    }()

    @UsesAutoLayout
    var likeButton: UIButton = {
        let btn = UIButton()
        return btn
    }()

    @UsesAutoLayout
    var dislikeButton: UIButton = {
        let btn = UIButton()
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()

        likeButton.addTarget(self, action: #selector(likeAction), for: .touchUpInside)
        dislikeButton.addTarget(self, action: #selector(dislikeAction), for: .touchUpInside)
    }

    @objc private func likeAction() {
        presenter.changedLikeStatus()
    }

    @objc private func dislikeAction() {
        presenter.changedDislikeStatus()
    }
}

extension RepoDetailsViewController: RepoDetailsView {
    func setDetails() {
        repoNameLabel.text = presenter.repoName
        userNameLabel.text = presenter.userName
        starsLabel.text = presenter.stars

        languageLabel.text = presenter.language
        languageBullet.backgroundColor = UIColor(hex: presenter.languageColor)

        creationDateLabel.text = presenter.createdOn
        repoDescLabel.text = presenter.repoDesc

        guard let avatarURL = presenter.avatarURL else { return }
        userImageView.setImage(url: avatarURL) { [weak self] success in
            if success {
                self?.userImageView.backgroundColor = .clear
            }
        }
    }

    func setLikeDislike() {
        if presenter.isLiked {
            likeButton.setImage(UIImage(named: ImageNames.liked), for: .normal)
        } else {
            likeButton.setImage(UIImage(named: ImageNames.like), for: .normal)
        }
        if presenter.isDisliked {
            dislikeButton.setImage(UIImage(named: ImageNames.disliked), for: .normal)
        } else {
            dislikeButton.setImage(UIImage(named: ImageNames.dislike), for: .normal)
        }
    }

    func displayAlert(title: String, message: String) {
        self.showAlert(title: title, message: message)
    }
}
