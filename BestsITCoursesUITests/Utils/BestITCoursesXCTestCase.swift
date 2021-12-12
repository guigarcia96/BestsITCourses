//
//  BestITCoursesXCTestCase.swift
//  BestsITCoursesUITests
//
//  Created by Guilherme Moraes on 13/11/21.
//

import Foundation

import XCTest

class BestITCoursesXCTestCase: XCTestCase {
    var app: XCUIApplication!
    var isKeyboardBeingShown: Bool {
        return app.keyboards.count > 0
    }

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }

    func launch() {
        launchWith()
    }

    func launchWith() {
        app = XCUIApplication()
        app.launchArguments = [
            "mockedData"
        ]
        app.launch()
    }

    func swipeDown() {
        app.swipeDown()
    }

    func closeApp() {
        app.terminate()
    }
}

extension XCUIElement {
    var valueString: String? {
        value as? String
    }
}
