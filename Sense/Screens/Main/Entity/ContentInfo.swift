//
//  ContentInfo.swift
//  Sense
//
//  Created by Hüseyin Vural on 4.04.2021.
//

import Foundation

protocol ContentInfo {
    var type: ContentType { get }
    var title: String { get }
    var subtitle: String { get }
    var date: String { get }
    var content: String { get }
    var images: ContentImages { get }
}

protocol ContentImages: Decodable {
    var small: String { get }
    var large: String { get }
}
