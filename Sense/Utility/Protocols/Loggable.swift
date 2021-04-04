//
//  Loggable.swift
//  Sense
//
//  Created by Hüseyin Vural on 4.04.2021.
//

import Foundation

public protocol Loggable {
    func log(params: [Events: Any])
}
