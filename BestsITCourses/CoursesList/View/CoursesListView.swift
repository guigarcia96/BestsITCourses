//
//  CoursesListView.swift
//  BestsITCourses
//
//  Created by Guilherme Moraes on 05/06/21.
//

import UIKit

class CoursesListView: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(CoursesTableViewCell.self, forCellReuseIdentifier: "cellID")
        return tableView
    }()
    
    var viewModel:CoursesListViewModel
    
    init(
        viewModel: CoursesListViewModel
    ) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        backgroundColor = .white
        configure()
        setupUI()
        reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubviews([tableView])
        tableView
            .topToSuperview(10, toSafeArea: true)
            .edgesToSuperView(excluding: .top, toSafeArea: true)
        
    }
    
    private func configure() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}
extension CoursesListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categorie?.courses.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath as IndexPath) as? CoursesTableViewCell else { return UITableViewCell() }
        if let course = viewModel.categorie?.courses[indexPath.row] {
            cell.setup(course: course)
        }
        return cell
    }
    
    
}

