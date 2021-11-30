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

        navigationBarAppearance()
        setupTitle()
        setupUserDetails()
        setupRepoDetails()
        setupDateLabels()
        setupLikeDislike()
        setupDescLabel()
    }

    func navigationBarAppearance() {
        self.title = "Details"
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    func setupTitle() {
        view.addSubview(repoNameLabel)

        let constraints = [
            repoNameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            repoNameLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            repoNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 16)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    func setupUserDetails() {
        view.addSubview(userImageView)
        view.addSubview(userNameLabel)

        var constraints = [
            userImageView.topAnchor.constraint(equalTo: repoNameLabel.bottomAnchor, constant: 20),
            userImageView.leftAnchor.constraint(equalTo: repoNameLabel.leftAnchor),
            userImageView.heightAnchor.constraint(equalToConstant: 80),
            userImageView.widthAnchor.constraint(equalToConstant: 80)
        ]
        NSLayoutConstraint.activate(constraints)

        constraints = [
            userNameLabel.topAnchor.constraint(equalTo: userImageView.topAnchor),
            userNameLabel.leftAnchor.constraint(equalTo: userImageView.rightAnchor, constant: 20.0),
            userNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20.0)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    func setupRepoDetails() {
        view.addSubview(languageBullet)
        view.addSubview(languageLabel)
        view.addSubview(starsLabel)

        var constraints = [
            languageBullet.leftAnchor.constraint(equalTo: userNameLabel.leftAnchor),
            languageBullet.widthAnchor.constraint(equalToConstant: 10.0),
            languageBullet.heightAnchor.constraint(equalToConstant: 10.0),
            languageBullet.centerYAnchor.constraint(equalTo: languageLabel.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)

        constraints = [
            languageLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor,
                                            constant: 12.0),
            languageLabel.leftAnchor.constraint(equalTo: languageBullet.rightAnchor,
                                             constant: 8.0)
        ]
        NSLayoutConstraint.activate(constraints)

        let starImgView = UIImageView()
        starImgView.image = UIImage(named: ImageNames.star)
        starImgView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(starImgView)

        constraints = [
            starImgView.widthAnchor.constraint(equalToConstant: 14.0),
            starImgView.heightAnchor.constraint(equalToConstant: 14.0),
            starImgView.centerYAnchor.constraint(equalTo: starsLabel.centerYAnchor),
            starImgView.leftAnchor.constraint(equalTo: languageBullet.leftAnchor)
        ]
        NSLayoutConstraint.activate(constraints)

        constraints = [
            starsLabel.topAnchor.constraint(equalTo: languageLabel.bottomAnchor,
                                            constant: 10.0),
            starsLabel.leftAnchor.constraint(equalTo: starImgView.rightAnchor,
                                             constant: 8.0)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    func setupDateLabels() {
        @UsesAutoLayout
        var createdLabel: UILabel = {
            let label = UILabel()
            label.font = AppFonts.italicLbl
            label.textColor = UIColor.secondaryLabel
            label.text = "Created On:"
            return label
        }()

        view.addSubview(createdLabel)
        view.addSubview(creationDateLabel)

        var constraints = [
            createdLabel.leftAnchor.constraint(equalTo: userImageView.leftAnchor),
            createdLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 16)
        ]
        NSLayoutConstraint.activate(constraints)

        constraints = [
            creationDateLabel.leftAnchor.constraint(equalTo: createdLabel.rightAnchor, constant: 8),
            creationDateLabel.topAnchor.constraint(equalTo: createdLabel.topAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    func setupLikeDislike() {
        view.addSubview(likeButton)
        view.addSubview(dislikeButton)

        var constraints = [
            likeButton.heightAnchor.constraint(equalToConstant: 44),
            likeButton.widthAnchor.constraint(equalToConstant: 44),
            likeButton.leftAnchor.constraint(equalTo: userImageView.leftAnchor),
            likeButton.topAnchor.constraint(equalTo: creationDateLabel.bottomAnchor, constant: 20)
        ]
        NSLayoutConstraint.activate(constraints)

        constraints = [
            dislikeButton.heightAnchor.constraint(equalToConstant: 44),
            dislikeButton.widthAnchor.constraint(equalToConstant: 44),
            dislikeButton.leftAnchor.constraint(equalTo: likeButton.rightAnchor, constant: 26),
            dislikeButton.topAnchor.constraint(equalTo: likeButton.topAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    func setupDescLabel() {
        view.addSubview(repoDescLabel)

        let constraints = [
            repoDescLabel.leftAnchor.constraint(equalTo: userImageView.leftAnchor),
            repoDescLabel.topAnchor.constraint(equalTo: dislikeButton.bottomAnchor, constant: 20),
            repoDescLabel.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: 20)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
