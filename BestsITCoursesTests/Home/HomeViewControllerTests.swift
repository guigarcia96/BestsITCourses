//
//  HomeViewControllerTests.swift
//  BestsITCoursesTests
//
//  Created by Guilherme Moraes on 13/09/21.
//

import XCTest
@testable import BestsITCourses

class HomeViewControllerTests: XCTestCase {

    private var homeViewController: HomeViewController!

    override func setUpWithError() throws {
        homeViewController = HomeViewController()
    }

    override func tearDownWithError() throws {
        homeViewController = nil
    }

    func testSetupView() {
        homeViewController.viewDidLoad()
        XCTAssertEqual(homeViewController.title, "Categorias")
        XCTAssertEqual(homeViewController.navigationItem.rightBarButtonItem?.tintColor, .black)
    }
}
