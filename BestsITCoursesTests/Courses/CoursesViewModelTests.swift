//
//  CoursesViewModelTests.swift
//  BestsITCoursesTests
//
//  Created by Guilherme Moraes on 14/09/21.
//

import XCTest
@testable import BestsITCourses

class CoursesViewModelTests: XCTestCase {
    
    var coursesViewModel: CoursesListViewModel!

    override func setUpWithError() throws {
        let course = Course(courseID: "1", courseName: "TESTE", courseImage: "http://teste.com", courseDescription: "Mocked Test")
        let category = Categories(id: "1", name: "Guilherme", imageURL: "...", color: "#ffffff", courses: [course])
        coursesViewModel = CoursesListViewModel(categorie: category)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCategory() {
        let course = Course(courseID: "1", courseName: "TESTE", courseImage: "http://teste.com", courseDescription: "Mocked Test")
        let category = Categories(id: "1", name: "Guilherme", imageURL: "...", color: "#ffffff", courses: [course])
        XCTAssertEqual(category.id, "1")
        XCTAssertEqual(category.name, "Guilherme")
        XCTAssertEqual(category.imageURL, "...")
        XCTAssertEqual(category.color, "#ffffff")
    }
}
