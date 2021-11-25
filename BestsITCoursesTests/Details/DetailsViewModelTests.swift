//
//  DetailsViewModelTests.swift
//  BestsITCoursesTests
//
//  Created by Guilherme Moraes on 14/09/21.
//

import XCTest
@testable import BestsITCourses

class DetailsViewModelTests: XCTestCase {
    
    var detailsViewModel: DetailsViewModel!
    var course: Course!
    var details: DetailsViewInfo!

    override func setUpWithError() throws {
        course = Course(courseID: "1", courseName: "TESTE", courseImage: "http://teste.com", courseDescription: "Mocked Test")
        detailsViewModel = DetailsViewModel(course: course)
        details = DetailsViewInfo(title: self.course?.courseName ?? "", subtitle: self.course?.courseDescription ?? "")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        detailsViewModel = nil
    }
    
    func testGetPopulateDetailsViewArray() {
        let detailsViewInfo = detailsViewModel.getPopulateDetailsViewArray().first
        XCTAssertEqual(detailsViewInfo?.title, details.title)
        XCTAssertEqual(detailsViewInfo?.subtitle, details.subtitle)
    }
}
