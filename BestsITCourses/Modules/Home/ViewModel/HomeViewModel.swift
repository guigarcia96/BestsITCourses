//
//  HomeViewModel.swift
//  BestsITCourses
//
//  Created by Guilherme Moraes on 30/05/21.
//

import Foundation
import UIKit

class HomeViewModel {
    private (set) var results:[Categories] = []
    private (set) var categories:[Categories] = []
    private (set) var searchedValue = ""
    private var categoriesService: CategoriesProvider
    weak var delegate: HomeView?

    init(categoriesService: CategoriesProvider = CategoriesService.shared) {
        self.categoriesService = categoriesService
        getCategories()
    }

    private func getCategories() {
        categoriesService.getCategories { [weak self](result) in
            switch result {
            case .success(let categories):
                self?.results = categories
                self?.categories = self?.results ?? []
                self?.delegate?.reloadData()
            case .failure:
                self?.delegate?.setupError()
            }
        }
    }

    func showSearchBar(viewController: HomeViewController) {
        viewController.searchController.searchBar.text = searchedValue

        // Set any properties (in this case, don't hide the nav bar)
        viewController.searchController.hidesNavigationBarDuringPresentation = false

        // Set The Placehold for the SearchBar
        viewController.searchController.searchBar.placeholder = "Digite a Categoria Desejada"

        // Make this class the delegate and present the search
        viewController.searchController.searchBar.delegate = viewController.self
        viewController.searchController.searchBar.enablesReturnKeyAutomatically = false
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
        if searchedValue != "" {
            controller.dismiss(animated: true)
            return
        }
        categories = results
        delegate?.reloadData()
        controller.dismiss(animated: true)
    }

    func returnButtonInKeyboardWasTapped(_ controller: UISearchController) {
        searchedValue = controller.searchBar.text ?? ""
        controller.dismiss(animated: true)
    }

}
