//
//  MainResponse.swift
//  Sense
//
//  Created by Hüseyin Vural on 4.04.2021.
//

import Foundation

struct MainResponse: Decodable, MainResponsable {
    let isBannerEnabled: Bool
    let meditations: [Meditation]
    let stories: [Story]
}
