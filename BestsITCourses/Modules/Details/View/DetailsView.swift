//
//  DetailsView.swift
//  BestsITCourses
//
//  Created by Guilherme Moraes on 15/06/21.
//

import Foundation
import UIKit
import youtube_ios_player_helper

protocol DetailsViewDelegate: AnyObject {
    func shareVideo(withURL: String)
}

class DetailsView: UIView {

    var viewModel:DetailsViewModel
    weak var delegate: DetailsViewDelegate?

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.register(DetailsViewCell.self, forCellReuseIdentifier: "cellID")
        return tableView
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
        configure()
        setupConstrainsts()
        setupYTPlayer()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupYTPlayer() {
        ytView.load(withVideoId: viewModel.course?.courseID ?? "", playerVars: ["playsinline": 1])
    }

    private func configure() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setupConstrainsts() {
        addSubviews([ytView, tableView])

        ytView
            .topToSuperview(toSafeArea: true)
            .horizontalToSuperview()
            .heightTo(300)

        tableView
            .topToBottom(of: ytView)
            .horizontalToSuperview()
            .bottomToSuperview()

        layoutSubviews()
    }

    private func reloadData() {
        tableView.reloadData()
    }

}

extension DetailsView: YTPlayerViewDelegate {

    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }

}

extension DetailsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getPopulateDetailsViewArray().count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath as IndexPath) as? DetailsViewCell else { return UITableViewCell() }
        let detailsInfoArray = viewModel.getPopulateDetailsViewArray()
        let detailsInfo = detailsInfoArray[indexPath.row]
        cell.setup(title: detailsInfo.title, subtitle: detailsInfo.subtitle)
        cell.onShareButtonTapped = {
            self.delegate?.shareVideo(withURL: "https://www.youtube.com/watch?v=\(self.viewModel.course?.courseID ?? "")")
        }
        return cell
    }
}
