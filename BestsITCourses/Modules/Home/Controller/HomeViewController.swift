//
//  ViewController.swift
//  BestsITCourses
//
//  Created by Guilherme Moraes on 30/05/21.
//

import UIKit

class HomeViewController: UIViewController, UISearchBarDelegate{
   
    let viewModel = HomeViewModel()
    
    lazy var myView: HomeView = {
        let view = HomeView()
        view.delegate = self
        return view
    }()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = myView
        setupView()
        viewModel.delegate = myView
        myView.viewModel = viewModel
    }
    
    private func setupView() {
        title = "Categorias"
        let btnSearch = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(addTapped))
        btnSearch.tintColor = .black
        navigationItem.rightBarButtonItem = btnSearch
    }
    
    @objc func addTapped() {
        viewModel.showSearchBar(vc: self)
    }
    
    private func handleNewTap(_ categorie: Categories) {
       goToCourseListScreen(categorie)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterData(searchText: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.cancelSearchBarButtonTapped(searchController)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.returnButtonInKeyboardWasTapped(searchController)
    }
    
    private func goToCourseListScreen(_ categorie: Categories) {
        let courseVM = CoursesListViewModel(categorie: categorie)
        let courseVC = CoursesListViewController(viewModel: courseVM)
        navigationController?.pushViewController(courseVC, animated: true)
    }
}
extension HomeViewController: HomeViewDelegate {
    func didTap(a categorie: Categories) {
        handleNewTap(categorie)
    }
    
    
}


