//
//  HomeViewModel.swift
//  BestsITCoursesTests
//
//  Created by Guilherme Moraes on 26/08/21.
//

import XCTest
@testable import BestsITCourses

class HomeViewModelTests: XCTestCase {

    private var homeViewModel: HomeViewModel!
    private var categoriesService: CategoriesServiceMock!
    private var homeViewController = HomeViewController()

    override func setUpWithError() throws {
        categoriesService = CategoriesServiceMock()
        homeViewModel = HomeViewModel(categoriesService: categoriesService)
    }

    override func tearDownWithError() throws {
        homeViewModel = nil
        categoriesService = nil
    }

    func testFilteredData() {
        homeViewModel.filterData(searchText: "Swift")
        let viewModelResult = homeViewModel.categories
        let course = Course(courseID: "1", courseName: "Aprenda Swift - Inicio", courseImage: "", courseDescription: "Aprenda Swift do 0 ao profissional")
        let category = Categories(id: "1", name: "Swift", imageURL: "https://img2.gratispng.com/20180716/bbv/kisspng-swift-apple-logo-apple-vector-5b4c4b78df8b61.3778424215317267129157.jpg", color: "#000000", courses: [course])

        XCTAssertEqual(viewModelResult.first?.name, category.name)
        XCTAssertEqual(viewModelResult.first?.id, category.id)
        XCTAssertEqual(viewModelResult.first?.imageURL, category.imageURL)
        XCTAssertEqual(viewModelResult.first?.color, category.color)
    }

    func testShowSearchBar() {
        homeViewModel.showSearchBar(viewController: homeViewController)
        XCTAssertFalse(homeViewController.searchController.hidesNavigationBarDuringPresentation)
        XCTAssertEqual(homeViewController.searchController.searchBar.placeholder, "Digite a Categoria Desejada")
    }
}
