//
//  CoursesListViewController.swift
//  BestsITCourses
//
//  Created by Guilherme Moraes on 05/06/21.
//

import UIKit

class CoursesListViewController: UIViewController {
    
    var viewModel: CoursesListViewModel
    
    lazy var myView: CoursesListView = {
        let view = CoursesListView(viewModel: viewModel)
        view.delegate = self
        return view
    }()
    
    init(viewModel: CoursesListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = myView
        setupTitle()
    }
    
    private func setupTitle() {
        title = viewModel.categorie?.name
    }
}
extension CoursesListViewController: CoursesListViewContract {
    func didTapCourse(a course: Course) {
        let courseVM = DetailsViewModel(course: course)
        let courseVC = DetailsViewController(viewModel: courseVM)
        navigationController?.pushViewController(courseVC, animated: true)
    }
    
    
}

