//
//  MainResponsable.swift
//  Sense
//
//  Created by Hüseyin Vural on 4.04.2021.
//

import Foundation

protocol MainResponsable {
    var isBannerEnabled: Bool { get }
    var meditations: [Meditation] { get }
    var stories: [Story] { get }
}
