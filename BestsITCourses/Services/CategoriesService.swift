//
//  CategoriesService.swift
//  BestsITCourses
//
//  Created by Guilherme Moraes on 01/06/21.
//

import Foundation

protocol CategoriesProvider {
    func getCategories(completion: @escaping (Result<[Categories], CategoryError>) -> Void)
}

enum CategoryError: Swift.Error, Equatable {
    case invalidURL
    case dataNotSent
    case errorDecondingData
    case connectionCanceled
    case errorInResponse
}

public class ReturnCategorieService {
    
    static var shared = ReturnCategorieService()
    
    private init() {
        
    }
    
    func returnService() -> CategoriesProvider {
        if CommandLine.arguments.contains("mockedData") {
            return CategoriesServiceMock()
        } else {
            return CategoriesService()
        }
    }
}

class CategoriesService: CategoriesProvider {
    
    func getCategories(completion: @escaping (Result<[Categories], CategoryError>) -> Void) {

            let serviceString = "https://60b62212fe923b0017c856f1.mockapi.io/api/v1/courses"

            guard let serviceURL = URL(string: serviceString ) else {
                completion(.failure(.invalidURL))
                return
            }

            var urlRequest = URLRequest(url: serviceURL)
            urlRequest.httpMethod = "GET"

            let session = URLSession.shared.dataTask(with: urlRequest) { data, response, error in

                let httpResponse = response as? HTTPURLResponse

                guard let data = data else {
                    DispatchQueue.main.async { completion(.failure(.dataNotSent)) }
                    return
                }

                if let error = error as NSError? {
                    if error.code != NSURLErrorCancelled {
                        DispatchQueue.main.async { completion(.failure(.connectionCanceled)) }
                    }
                    return
                }

                guard let response = httpResponse, 200..<300 ~= response.statusCode else {
                    DispatchQueue.main.async { completion(.failure(.errorInResponse)) }
                    return
                }

                guard let decodedData = try? JSONDecoder().decode([Categories].self, from: data) else {
                    DispatchQueue.main.async { completion(.failure(.errorDecondingData)) }
                    return
                }
                DispatchQueue.main.async { completion(.success(decodedData)) }
            }
            session.resume()
        }
}
