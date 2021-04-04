//
//  Meditation.swift
//  Sense
//
//  Created by Hüseyin Vural on 4.04.2021.
//

import Foundation

struct Meditation: Decodable, ContentInfo {
    var type: ContentType {
        return .meditation
    }
    
    var images: ContentImages {
        return image
    }
    
    let title, subtitle: String
    let image: Image
    let date, content: String
    
    private enum CodingKeys : String, CodingKey {
        case title
        case subtitle
        case image
        case date = "releaseDate"
        case content
    }
}
