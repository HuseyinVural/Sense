//
//  NetworkProvider.swift
//  Sense
//
//  Created by Hüseyin Vural on 3.04.2021.
//

import Foundation

protocol NetworkProvidable {
    func main(completion: @escaping (Result<Data, Error>) -> Void)
}

class NetworkProvider: NetworkProvidable {
    private let session = URLSession.shared
    private let baseURL = Constants.baseURL
    func main(completion: @escaping (Result<Data, Error>) -> Void) {
        let request = URLRequest(url: URL(string: baseURL)!)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                completion(.success(data))
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

enum APIError: Error {
    case unknown
}

