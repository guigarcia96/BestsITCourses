//
//  TitleAndSubtitleTableViewCell.swift
//  BestsITCourses
//
//  Created by Guilherme Moraes on 23/08/21.
//

import UIKit

class DetailsViewCell: UITableViewCell {

    var onShareButtonTapped: (() -> Void)?

    private var titleLabel: UILabel = {
        var label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()

    private var subtitleLabel: UILabel = {
        var label = UILabel()
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()

    private var shareButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Compartilhar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
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
        shareButton.addTarget(self, action: #selector(shareButtonAction(sender:)), for: .touchUpInside)
        setupUI()
    }

    private func setupUI() {
        contentView.addSubviews([titleLabel, subtitleLabel, shareButton])

        titleLabel
            .topToSuperview(8)
            .horizontalToSuperview(8)

        subtitleLabel
            .topToBottom(of: titleLabel, margin: 8)
            .horizontalToSuperview(8)

        shareButton
            .topToBottom(of: subtitleLabel, margin: 16)
            .centerHorizontalToSuperView()
            .bottomToSuperview()
            .widthTo(160)
            .heightTo(40)

        contentView.layoutSubviews()
    }

    @objc private func shareButtonAction(sender: UIButton) {
        onShareButtonTapped?()
    }

}
