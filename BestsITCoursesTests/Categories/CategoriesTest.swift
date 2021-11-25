//
//  CategoriesTest.swift
//  BestsITCoursesTests
//
//  Created by Guilherme Moraes on 05/06/21.
//

import XCTest
@testable import BestsITCourses

class CategoriesTest: XCTestCase {

    private var course: Course!
    private var category: Categories!

    override func setUpWithError() throws {
        course = Course(courseID: "1", courseName: "TESTE", courseImage: "http://teste.com", courseDescription: "Mocked Test")
        category = Categories(id: "1", name: "Guilherme", imageURL: "...", color: "#ffffff", courses: [course])
    }

    override func tearDownWithError() throws {
        course = nil
        category = nil
    }

    func testCategorie() {
        XCTAssertEqual(category.id, "1")
        XCTAssertEqual(category.name, "Guilherme")
        XCTAssertEqual(category.imageURL, "...")
        XCTAssertEqual(category.color, "#ffffff")
    }
    func testCourse() {
        XCTAssertEqual(course.courseID, "1")
        XCTAssertEqual(course.courseName, "TESTE")
        XCTAssertEqual(course.courseImage, "http://teste.com")
        XCTAssertEqual(course.courseDescription, "Mocked Test")
    }
}
