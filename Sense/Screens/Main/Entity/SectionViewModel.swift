//
//  SectionViewModel.swift
//  Sense
//
//  Created by Hüseyin Vural on 4.04.2021.
//

import Foundation
import UIKit

struct SectionViewModel {
    var type: MainPageSectionParser.ItemType = .banner
    
    var numberOfSection: Int {
        switch type {
        case .banner, .collection, .header:
            return 1
        case .content(let contents):
            return contents.count
        }
    }
    
    var cellId: String {
        switch type {
        case .banner:
            return "BannerCollectionCell"
        case .collection:
            return "MeditationListCell"
        case .header:
            return "SectionHeaderCell"
        case .content:
            return "StoryItemViewCell"
        }
    }
    
    func itemInfo(_ index: Int) -> Any? {
        switch type {
        case .collection(let sections): return sections
        case .header(let tile): return tile
        case .content(let contents): return contents[index]
        default: return nil
        }
    }
    
    func size(bounds: CGSize) -> CGSize {
        switch type {
        case .banner:
            return CGSize(width: bounds.width, height: Constants.defaultEstimatedHeight)
        case .collection:
            let width = bounds.width / slice(bounds)
            return CGSize(width: bounds.width, height: width / Constants.horizontalCollectionRatio)
        case .header:
            return CGSize(width: bounds.width, height: Constants.defaultEstimatedHeight)
        case .content:
            let width = floor(bounds.width / slice(bounds)) - 1
            return CGSize(width: width, height: bounds.height)
        }
    }
    
    func slice(_ size: CGSize) -> CGFloat {
        let width = size.width
        let isIpad = UIDevice.current.userInterfaceIdiom == .pad

        if UIDevice.current.orientation.isLandscape && isIpad && width > 768 {
            return 6
        } else if width > 650 {
            return 4
        } else if width > 450 {
            return 3
        } else {
            return 2
        }
    }
}
