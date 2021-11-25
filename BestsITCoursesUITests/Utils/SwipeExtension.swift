//
//  SwipeExtension.swift
//  BestsITCoursesUITests
//
//  Created by Guilherme Moraes on 13/11/21.
//

import Foundation
import XCTest

extension XCUIElement {
    public func swipeUp(to element: XCUIElement) {
        while !(elementIsWithinWindow(element: element)) {
            XCUIApplication().gentleSwipe(.up)
        }
    }

    private func elementIsWithinWindow(element: XCUIElement) -> Bool {
        guard element.exists && element.isHittable else {return false}
        return true
    }

    enum Direction: Int {
        case up, down, left, right
    }

    func gentleSwipe(_ direction: Direction) {
        let half: CGFloat = 0.5
        let adjustment: CGFloat = 0.25
        let pressDuration: TimeInterval = 0.05

        let lessThanHalf = half - adjustment
        let moreThanHalf = half + adjustment

        let centre = self.coordinate(withNormalizedOffset: CGVector(dx: half, dy: half))
        let aboveCentre = self.coordinate(withNormalizedOffset: CGVector(dx: half, dy: lessThanHalf))
        let belowCentre = self.coordinate(withNormalizedOffset: CGVector(dx: half, dy: moreThanHalf))
        let leftOfCentre = self.coordinate(withNormalizedOffset: CGVector(dx: lessThanHalf, dy: half))
        let rightOfCentre = self.coordinate(withNormalizedOffset: CGVector(dx: moreThanHalf, dy: half))

        switch direction {
        case .up:
            centre.press(forDuration: pressDuration, thenDragTo: aboveCentre)
        case .down:
            centre.press(forDuration: pressDuration, thenDragTo: belowCentre)
        case .left:
            centre.press(forDuration: pressDuration, thenDragTo: leftOfCentre)
        case .right:
            centre.press(forDuration: pressDuration, thenDragTo: rightOfCentre)
        }
    }
}
