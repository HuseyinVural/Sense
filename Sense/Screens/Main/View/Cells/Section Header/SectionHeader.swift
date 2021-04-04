//
//  SectionHeader.swift
//  Sense
//
//  Created by Hüseyin Vural on 3.04.2021.
//

import UIKit

class SectionHeader: UICollectionViewCell, ConfigurableCell {
    @IBOutlet private weak var headerTitle: UILabel!
    
    func configure(_ data: Any?, size: CGSize) {
        guard let title = data as? String else {
            fatalError("The model is incompatible.")
        }
        
        headerTitle.text = title
    }
}
