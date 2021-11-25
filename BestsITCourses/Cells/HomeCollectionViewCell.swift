//
//  HomeCollectionViewCell.swift
//  BestsITCourses
//
//  Created by Guilherme Moraes on 31/05/21.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    lazy var cellImage: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var cellLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        cellImage.image = nil
        cellLabel.text = nil
    }

    public func setup(_ categories: Categories) {
        cellLabel.text = categories.name
        cellImage.from(url: categories.imageURL)
        contentView.backgroundColor = UIColor(hex: "\(categories.color)ff")
        setupUI()
    }

    private func setupUI() {
        setupConstrains()
        setupRoundedBorder()
    }

    private func setupConstrains() {
        contentView.addSubviews([cellImage, cellLabel])

        cellImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        cellImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        cellImage
            .heightTo(80)
        
        cellLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        cellLabel
            .topToBottom(of: cellImage, margin: 2)
            .bottomToSuperview(6)

        contentView.layoutSubviews()

    }

    private func setupRoundedBorder() {
        contentView.layer.cornerRadius = 6.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true

        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 6.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        layer.backgroundColor = UIColor.clear.cgColor
    }

}
