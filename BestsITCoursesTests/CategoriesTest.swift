//
//  CategoriesTest.swift
//  BestsITCoursesTests
//
//  Created by Guilherme Moraes on 05/06/21.
//

import XCTest
@testable import BestsITCourses

class CategoriesTest: XCTestCase {

    func testCategorie() {
        let categorie = Categories(id: "1", name: "Guilherme", imageURL: "...", color: "#ffffff")
        XCTAssertEqual(categorie.id, "1")
        XCTAssertEqual(categorie.name, "Guilherme")
        XCTAssertEqual(categorie.imageURL, "...")
        XCTAssertEqual(categorie.color, "#ffffff")
    }
}
