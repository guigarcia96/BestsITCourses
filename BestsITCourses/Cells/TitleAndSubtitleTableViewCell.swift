//
//  TitleAndSubtitleTableViewCell.swift
//  BestsITCourses
//
//  Created by Guilherme Moraes on 23/08/21.
//

import UIKit

class TitleAndSubtitleTableViewCell: UITableViewCell {

    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()

    lazy var subtitleLabel: UILabel = {
        var label = UILabel()
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        subtitleLabel.text = nil
    }

    func setup(title: String, subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        setupUI()
    }

    private func setupUI() {
        contentView.addSubviews([titleLabel, subtitleLabel])

        titleLabel
            .topToSuperview(8)
            .horizontalToSuperview(8)

        subtitleLabel
            .topToBottom(of: titleLabel, margin: 8)
            .horizontalToSuperview(8)

        contentView.layoutSubviews()
    }

}
