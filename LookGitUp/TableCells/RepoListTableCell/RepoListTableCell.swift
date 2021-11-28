//
//  RepoListTableCell.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/28/21.
//

import UIKit

class RepoListTableCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupLabels()
    }

    func setupLabels() {
        contentView.addSubview(repoNameLabel)
        contentView.addSubview(starsLabel)
        contentView.addSubview(languageLabel)
        contentView.addSubview(languageBullet)
        contentView.addSubview(starImgView)

        var constraints = [
            repoNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                            constant: 12.0),
            repoNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,
                                             constant: 20.0),
            repoNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,
                                              constant: -20.0)
        ]
        NSLayoutConstraint.activate(constraints)

        constraints = [
            languageBullet.leftAnchor.constraint(equalTo: repoNameLabel.leftAnchor),
            languageBullet.widthAnchor.constraint(equalToConstant: 10.0),
            languageBullet.heightAnchor.constraint(equalToConstant: 10.0),
            languageBullet.centerYAnchor.constraint(equalTo: languageLabel.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)

        constraints = [
            languageLabel.topAnchor.constraint(equalTo: repoNameLabel.bottomAnchor,
                                            constant: 10.0),
            languageLabel.leftAnchor.constraint(equalTo: languageBullet.rightAnchor,
                                             constant: 8.0)
        ]
        NSLayoutConstraint.activate(constraints)

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
                                             constant: 8.0),
            starsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                            constant: -10.0)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

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
    var starImgView: UIImageView = {
        let starImgView = UIImageView()
        starImgView.image = UIImage(named: ImageNames.star)
        return starImgView
    }()
}

extension RepoListTableCell: RepoListItemView {
    func updateItem(with repo: Repo) {
        repoNameLabel.text = repo.name
        languageLabel.text = repo.language
        starsLabel.text = String(repo.stars)
        languageBullet.backgroundColor = repo.languageColor()
    }
}
