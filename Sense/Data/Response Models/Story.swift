//
//  Story.swift
//  Sense
//
//  Created by Hüseyin Vural on 4.04.2021.
//

import Foundation

struct Story: Decodable, ContentInfo {
    var type: ContentType {
        return .story
    }
    
    var images: ContentImages {
        return image
    }
    
    let title, subtitle: String
    let image: Image
    let date, content: String
    
    private enum CodingKeys : String, CodingKey {
        case title = "name"
        case subtitle = "category"
        case image
        case date
        case content = "text"
    }
}
