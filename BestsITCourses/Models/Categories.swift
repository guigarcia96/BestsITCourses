//
//  Categories.swift
//  BestsITCourses
//
//  Created by Guilherme Moraes on 31/05/21.
//

import Foundation

struct Categories: Codable {
    let id: String
    let name: String
    let imageURL: String
    let color: String
    let courses: [Course]
}

struct Course: Codable {
    let courseID, courseName: String
    let courseImage: String
    let courseDescription: String

    enum CodingKeys: String, CodingKey {
        case courseID = "courseId"
        case courseName, courseImage, courseDescription
    }
}
