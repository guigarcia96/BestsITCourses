//
//  HomeViewModel.swift
//  BestsITCourses
//
//  Created by Guilherme Moraes on 30/05/21.
//

import Foundation
import UIKit

class HomeViewModel {
    var results:[Categories] = []
    var categories:[Categories] = []
    weak var delegate: HomeView?

    init() {
        getCategories()
    }

    private func getCategories() {
        let categories = CategoriesService()

        categories.getCategories { [weak self](result) in
            switch result {
            case .success(let categories):
                self?.results = categories
                self?.categories = self?.results ?? []
                self?.delegate?.reloadData()
            case .failure:
                print("No Categories were returned")
            }
        }
    }

    func showSearchBar(viewController: HomeViewController) {

        // Set any properties (in this case, don't hide the nav bar)
        viewController.searchController.hidesNavigationBarDuringPresentation = false

        // Set The Placehold for the SearchBar
        viewController.searchController.searchBar.placeholder = "Digite a Categoria Desejada"

        // Make this class the delegate and present the search
        viewController.searchController.searchBar.delegate = viewController.self
        viewController.present(viewController.searchController, animated: true, completion: nil)
    }

    func filterData(searchText: String) {
        categories = results
        if searchText != "" {
            let filteredList = categories.filter { (categorie) -> Bool in
                return categorie.name.contains(searchText)
            }
            categories = filteredList
        }

        delegate?.reloadData()
    }

    func cancelSearchBarButtonTapped(_ controller: UISearchController) {
        categories = results
        delegate?.reloadData()
        controller.dismiss(animated: true)
    }

    func returnButtonInKeyboardWasTapped(_ controller: UISearchController) {
        controller.dismiss(animated: true)
    }

}
