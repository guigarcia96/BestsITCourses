//
//  HomeViewUITest.swift
//  BestsITCoursesUITests
//
//  Created by Guilherme Moraes on 13/11/21.
//

import XCTest

class HomeViewUITest: BestITCoursesXCTestCase {

    override func setUp() {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    
    func testBestITCourseHasSwiftCategory() {
        launchWith()
        let app = XCUIApplication()
        XCTAssertTrue(app.collectionViews.cells.otherElements.containing(.staticText, identifier: "Swift").element.exists)
    }
    
}
