//
//  CategoriesServiceMock.swift
//  BestsITCourses
//
//  Created by Guilherme Moraes on 11/09/21.
//

import UIKit


class CategoriesServiceMock: CategoriesProvider {
    
    var error = false
    
    
    
    func getCategories(completion: @escaping (Result<[Categories], CategoryError>) -> Void) {
            completion((.success(populateMockedCategories())))
    }
    
    func getCategoriesError() -> CategoryError {
        return .invalidURL
    }
    
    private func populateMockedCategories() -> [Categories] {
        let swiftCourse = Course(courseID: "1", courseName: "Aprenda Swift - Inicio", courseImage: "", courseDescription: "Aprenda Swift do 0 ao profissional")
        let swift = Categories(id: "1", name: "Swift", imageURL: "https://img2.gratispng.com/20180716/bbv/kisspng-swift-apple-logo-apple-vector-5b4c4b78df8b61.3778424215317267129157.jpg", color: "#000000", courses: [swiftCourse])
        return [swift]
    }
}
