//
//  CoursesListView.swift
//  BestsITCourses
//
//  Created by Guilherme Moraes on 05/06/21.
//

import UIKit

class CoursesListView: UIView {

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var viewModel:CoursesListViewModel
    
    init(
        viewModel: CoursesListViewModel
    ) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        backgroundColor = .white
        setupText()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(label)
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    private func setupText() {
        label.text = viewModel.categorie?.name ?? ""
    }
    
    
    
    
}
