//
//  CoursesTableViewCell.swift
//  BestsITCourses
//
//  Created by Guilherme Moraes on 05/06/21.
//

import UIKit

class CoursesTableViewCell: UITableViewCell {
    
    lazy var cellImage: UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    
    lazy var cellTitleLabel: UILabel = {
        var label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var cellDescriptionLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .natural
        label.textColor = .systemGray
        label.font = label.font.withSize(12)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellImage.image = nil
        cellTitleLabel.text = nil
        cellDescriptionLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(course: Course) {
        cellImage.from(url: course.courseImage)
        cellTitleLabel.text = course.courseName
        cellDescriptionLabel.text = course.courseDescription
        setupUI()
    }
    
    private func setupUI() {
        
        contentView.addSubviews([cellImage, cellTitleLabel, cellDescriptionLabel])
        
        cellImage
            .verticalToSuperview(8)
            .leadingToSuperview(8, priority: .required)
            .heightTo(100, priority: .required)
            .widthTo(100, priority: .required)
    
        cellTitleLabel
            .topToTop(of: cellImage)
            .leadingToTrailing(of: cellImage, priority: .required, margin: 8)
            .trailingToSuperview(8, priority: .required)
        
        
        cellDescriptionLabel
            .topToBottom(of: cellTitleLabel, margin: 4)
            .leadingToTrailing(of: cellImage, priority: .required, margin: 8)
            .trailingToSuperview(8, priority: .required)
            .bottomToSuperview(16, priority: .defaultHigh)
        
        contentView.layoutSubviews()
        
    }
}
