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
    
    func testSearchBarWithSwiftValue() {
        launchWith()
        let app = XCUIApplication()
        XCTAssertTrue(app.navigationBars["Categorias"].buttons["Search"].exists)
        app.navigationBars["Categorias"].buttons["Search"].tap()
        XCTAssertTrue(app.searchFields["Digite a Categoria Desejada"].exists)
        app.searchFields["Digite a Categoria Desejada"].typeText("Swift")
        app.buttons["buscar"].tap()
        XCTAssertTrue(app.collectionViews.cells.otherElements.containing(.staticText, identifier: "Swift").element.exists)
    }
    
    func testSearchBarWithWrongValue() {
        launchWith()
        let app = XCUIApplication()
        XCTAssertTrue(app.navigationBars["Categorias"].buttons["Search"].exists)
        app.navigationBars["Categorias"].buttons["Search"].tap()
        XCTAssertTrue(app.searchFields["Digite a Categoria Desejada"].exists)
        app.searchFields["Digite a Categoria Desejada"].typeText("PHP")
        app.buttons["buscar"].tap()
        XCTAssertFalse(app.collectionViews.cells.otherElements.containing(.staticText, identifier: "PHP").element.exists)
    }

}
