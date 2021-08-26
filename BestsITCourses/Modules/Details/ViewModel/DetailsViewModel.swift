//
//  DetailsViewModel.swift
//  BestsITCourses
//
//  Created by Guilherme Moraes on 15/06/21.
//

import Foundation

struct DetailsViewInfo {
    
    let title: String
    let subtitle: String
    
    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }
}

class DetailsViewModel {
    
    var course: Course?
    private var detailsInfoArray: [DetailsViewInfo] = []
    
    init(course: Course) {
        self.course = course
        populateDetailsViewArray()
    }
    
    private func populateDetailsViewArray() {
        let details = DetailsViewInfo(title: self.course?.courseName ?? "", subtitle: self.course?.courseDescription ?? "")
        detailsInfoArray.append(details)
    }
    
    public func getPopulateDetailsViewArray() -> [DetailsViewInfo] {
        return detailsInfoArray
    }
    
}
