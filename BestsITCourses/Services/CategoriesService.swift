//
//  CategoriesService.swift
//  BestsITCourses
//
//  Created by Guilherme Moraes on 01/06/21.
//

import Foundation

class CategoriesService {

    func getCategories(completion: @escaping (Result<[Categories], Error>) -> Void) {

            let serviceString = "https://60b62212fe923b0017c856f1.mockapi.io/api/v1/courses"

            guard let serviceURL = URL(string: serviceString ) else {
                completion(.failure(NSError(domain: "", code: 404, userInfo: nil)))
                return
            }

            var urlRequest = URLRequest(url: serviceURL)
            urlRequest.httpMethod = "GET"

            let session = URLSession.shared.dataTask(with: urlRequest) { data, response, error in

                let httpResponse = response as? HTTPURLResponse
                let statusCode = httpResponse?.statusCode ?? 400

                guard let data = data else {
                    let error = NSError(domain: "Data not sent or response", code: statusCode, userInfo: nil)
                    DispatchQueue.main.async { completion(.failure(error)) }
                    return
                }

                if let error = error as NSError? {
                    if error.code != NSURLErrorCancelled {
                        DispatchQueue.main.async { completion(.failure(error)) }
                    }
                    return
                }

                guard let response = httpResponse, 200..<300 ~= response.statusCode else {
                    let error = NSError(domain: "Error in the response", code: statusCode, userInfo: nil)
                    DispatchQueue.main.async { completion(.failure(error)) }
                    return
                }

                guard let decodedData = try? JSONDecoder().decode([Categories].self, from: data) else {
                    let error = NSError(domain: "Error while decoding the result", code: 0, userInfo: nil)
                    DispatchQueue.main.async { completion(.failure(error)) }
                    return
                }
                DispatchQueue.main.async { completion(.success(decodedData)) }
            }
            session.resume()
        }
}
