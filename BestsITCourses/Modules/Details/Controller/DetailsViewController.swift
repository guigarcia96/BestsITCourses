//
//  DetailsViewController.swift
//  BestsITCourses
//
//  Created by Guilherme Moraes on 15/06/21.
//

import UIKit

class DetailsViewController: UIViewController {

    var viewModel: DetailsViewModel

    lazy var myView: DetailsView = {
        let view = DetailsView(viewModel: viewModel)
        view.delegate = self
        return view
    }()

    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalhes"
        view = myView
    }
}

extension DetailsViewController: DetailsViewDelegate {
    func shareVideo(withURL: String) {
        let messageWithURL = "Olha esse vídeo que encontrei \(withURL)"
        let textShare = [messageWithURL]
        let activityViewController = UIActivityViewController(activityItems: textShare , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.isModalInPresentation = true
        self.present(activityViewController, animated: true, completion: nil)
    }
}
