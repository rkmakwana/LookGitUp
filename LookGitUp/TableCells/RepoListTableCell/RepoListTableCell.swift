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
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(authorLabel)

        var constraints = [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                            constant: 12.0),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,
                                             constant: 20.0),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,
                                              constant: -20.0)
        ]
        NSLayoutConstraint.activate(constraints)

        constraints = [
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                            constant: 10.0),
            dateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,
                                             constant: 20.0)
        ]
        NSLayoutConstraint.activate(constraints)

        constraints = [
            authorLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor,
                                            constant: 10.0),
            authorLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,
                                             constant: 20.0),
            authorLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                            constant: -10.0)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @UsesAutoLayout
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeTitleLbl
        label.textColor = UIColor.label
        label.text = "In case you need more time, please keep me informed."
        label.numberOfLines = 2
        return label
    }()

    @UsesAutoLayout
    var dateLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.cellSubtitleLbl
        label.textColor = UIColor.secondaryLabel
        label.text = "August 23, 2021"
        return label
    }()

    @UsesAutoLayout
    var authorLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.cellSubtitleLbl
        label.textColor = UIColor.tertiaryLabel
        label.text = "By Someone"
        return label
    }()
}
