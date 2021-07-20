//
//  DetailsView.swift
//  BestsITCourses
//
//  Created by Guilherme Moraes on 15/06/21.
//

import Foundation
import UIKit
import youtube_ios_player_helper

class DetailsView: UIView {
    
    var viewModel:DetailsViewModel
    
    lazy var titleLabel:UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 16)
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 0
        return title
    }()
    
    lazy var subtitleLabel:UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.font = .systemFont(ofSize: 14)
        subtitleLabel.numberOfLines = 0
        return subtitleLabel
    }()
    
    lazy var ytView: YTPlayerView = {
        let playerView = YTPlayerView()
        playerView.delegate = self
        return playerView
    }()
    
    init(
        viewModel: DetailsViewModel
    ) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        backgroundColor = .white
        setupText()
        setupConstrainsts()
        setupYTPlayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupYTPlayer() {
        ytView.load(withVideoId: viewModel.course?.courseID ?? "", playerVars: ["playsinline": 1])
    }
    
    private func setupText() {
        titleLabel.text = viewModel.course?.courseName
        subtitleLabel.text = viewModel.course?.courseDescription
    }
    
    private func setupConstrainsts() {
        addSubviews([ytView, titleLabel, subtitleLabel])
        
        ytView
            .topToSuperview(10, toSafeArea: true)
            .heightTo(300)
            .horizontalToSuperview()
        
        titleLabel
            .topToBottom(of: ytView, margin: 8)
            .leadingToSuperview(4, priority: .required)
            .trailingToSuperview(4, priority: .required)
        
        subtitleLabel
            .topToBottom(of: titleLabel, margin: 8)
            .leadingToSuperview(4)
            .trailingToSuperview(4)
        
        layoutSubviews()
    }
}

extension DetailsView: YTPlayerViewDelegate {
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
    
}
