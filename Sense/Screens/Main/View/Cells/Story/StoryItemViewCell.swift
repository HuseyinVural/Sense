//
//  StoryItemViewCell.swift
//  Sense
//
//  Created by Hüseyin Vural on 3.04.2021.
//

import UIKit
import Kingfisher

protocol ConfigurableCell: AnyObject {
    func configure(_ data: Any?, size: CGSize)
}

protocol SelectableCell: AnyObject {
    var didSelect: ((_ info: Any?) -> Void)? { get set }
}


class StoryItemViewCell: UICollectionViewCell, ConfigurableCell {
    
    @IBOutlet private var ratio: NSLayoutConstraint?
    @IBOutlet private weak var contentTitle: UILabel!
    @IBOutlet private weak var contentSubtitle: UILabel!
    @IBOutlet private weak var cover: UIImageView!
    @IBOutlet private weak var maxWidth: NSLayoutConstraint!
    

    func configure(_ data: Any?, size: CGSize) {
        guard let info = data as? ContentInfo else {
            fatalError("The model is incompatible.")
        }
        
        cover.kf.setImage(with: URL(string: info.images.small)!)
        contentTitle.text = info.title
        contentSubtitle.text = info.subtitle
        maxWidth.constant = size.width
        
        ratio?.isActive = info.type == .story
    }
}
