//
//  MainPageSectionParser.swift
//  Sense
//
//  Created by Hüseyin Vural on 4.04.2021.
//

import Foundation

protocol MainPageSectionParsable {
    func parse(_ response: MainResponsable) -> [SectionViewModel]
}

final class MainPageSectionParser {
    indirect enum ItemType {
        case collection(sections: ItemType)
        case header(title: String)
        case content(contents: [ContentInfo])
        case banner
    }
    
    func parse(_ response: MainResponsable) -> [SectionViewModel] {
        var sections: [SectionViewModel] = []
        sections.append(contentsOf: parseMediations(response.meditations))
        sections.append(contentsOf: parseBanner(response.isBannerEnabled))
        sections.append(contentsOf: parseStories(response.stories))
        return sections
    }
    
    private func parseMediations(_ items: [ContentInfo]) -> [SectionViewModel] {
        var sections: [SectionViewModel] = []
        sections.append(SectionViewModel(type: .header(title: Constants.meditationSectionTitle)))
        let meditationCollection = SectionViewModel(type: .collection(sections: ItemType.content(contents: items)))
        sections.append(meditationCollection)
        return sections
    }
    
    private func parseBanner(_ hasBanner: Bool) -> [SectionViewModel] {
        if hasBanner {
            return [SectionViewModel(type: .banner)]
        } else {
            return []
        }
    }
    
    private func parseStories(_ items: [ContentInfo]) -> [SectionViewModel] {
        var sections: [SectionViewModel] = []
        sections.append(SectionViewModel(type: .header(title: Constants.storiesSectionTitle)))
        sections.append(SectionViewModel(type: .content(contents: items)))
        return sections
    }
}
