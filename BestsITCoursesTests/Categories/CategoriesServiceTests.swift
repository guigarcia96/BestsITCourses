//
//  CategoriesServiceTest.swift
//  BestsITCoursesTests
//
//  Created by Guilherme Moraes on 11/09/21.
//

import XCTest
@testable import BestsITCourses

class CategoriesServiceTests: XCTestCase {

   private var categorieService: CategoriesServiceMock!
    private var categories: [Categories]!
    private var categoryError: CategoryError!

    override func setUpWithError() throws {
        categorieService = CategoriesServiceMock()
        categorieService.getCategories { [weak self](result) in
            switch result {
            case .success(let categories):
                self!.categories = categories
            case .failure(let error):
                self!.categoryError = error
            }
        }
        categoryError = categorieService.getCategoriesError()
    }

    override func tearDownWithError() throws {
        categorieService = nil
    }

    func testGetCategoriesWithSuccess() {
        for (index, element) in categories.enumerated() {
            let category = Categories(id: "\(index+1)", name: "Teste \(index+1)", imageURL: "https://img2.gratispng.com/20180716/bbv/kisspng-swift-apple-logo-apple-vector-5b4c4b78df8b61.3778424215317267129157.jpg", color: "#000000", courses: [])
            XCTAssertEqual(category.color, element.color)
            XCTAssertEqual(category.id, element.id)
            XCTAssertEqual(category.imageURL, element.imageURL)
        }
    }

    func testGetCategoriesWithError() {
        categorieService.error = true
        setUp()
        let error: CategoryError = .invalidURL
        XCTAssertEqual(error, categorieService.getCategoriesError())
    }

}
