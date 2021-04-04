//
//  UIView+Encodable.swift
//  Sense
//
//  Created by Hüseyin Vural on 4.04.2021.
//

import Foundation

extension Encodable {
    func encoded() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}
