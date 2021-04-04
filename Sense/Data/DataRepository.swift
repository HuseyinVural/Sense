//
//  DataRepository.swift
//  Sense
//
//  Created by Hüseyin Vural on 3.04.2021.
//

import Foundation

protocol DataRepositoryProtocol {
    func main(success: @escaping (MainResponsable) -> Void, fail: @escaping (Error) -> Void)
}

class DataRepository: DataRepositoryProtocol {
    private let network: NetworkProvidable
    
    init(_ network: NetworkProvidable) {
        self.network = network
    }
    
    func main(success: @escaping (MainResponsable) -> Void, fail: @escaping (Error) -> Void) {
        network.main { (result) in
            switch result {
            case .success(let data):
                do {
                    let response = try data.decoded() as MainResponse
                    success(response)
                } catch let error {
                    fail(error)
                }
            case .failure(let error):
                fail(error)
            }
        }
    }
}
