//
//  Data+Extension.swift
//  Sense
//
//  Created by Hüseyin Vural on 4.04.2021.
//

import Foundation

extension Data {
    func decoded<T: Decodable>() throws -> T {
        return try JSONDecoder().decode(T.self, from: self)
    }
}
