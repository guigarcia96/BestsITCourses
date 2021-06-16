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
    
    private lazy var ytView: YTPlayerView = {
        var view = YTPlayerView()
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        var label = UILabel()
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    init(
        viewModel: DetailsViewModel
    ) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        backgroundColor = .white
        setupConstrainsts()
        setupText()
        setupYTPlayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupYTPlayer() {
        ytView.delegate = self
        ytView.load(withVideoId: "bsM1qdGAVbU", playerVars: ["playsinline": 1])
    }
    
    private func setupText() {
        titleLabel.text = viewModel.course?.courseName
        subtitleLabel.text = viewModel.course?.courseDescription
    }
    
    private func setupConstrainsts() {
        addSubviews([ytView, titleLabel, subtitleLabel])
        ytView
            .topToSuperview(10, toSafeArea: true)
            .horizontalToSuperview()
            .heightTo(300)
        
        titleLabel
            .topToBottom(of: ytView, margin: 8)
            .horizontalToSuperview(4, priority: .required)
        
        subtitleLabel
            .topToBottom(of: titleLabel, margin: 8)
            .horizontalToSuperview(4, priority: .required)
    }
}
extension DetailsView: YTPlayerViewDelegate {
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
    
}
