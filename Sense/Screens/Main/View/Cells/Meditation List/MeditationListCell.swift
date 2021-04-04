//
//  MeditationListCell.swift
//  Sense
//
//  Created by Hüseyin Vural on 3.04.2021.
//

import UIKit

class MeditationListCell: UICollectionViewCell, SelectableCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var collectionManager: CollectionManager? = CollectionManager()
    
    var didSelect: ((Any?) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: StoryItemViewCell.reuseIdentifier, bundle: nil),
                                forCellWithReuseIdentifier: StoryItemViewCell.reuseIdentifier)
        collectionView.delegate = collectionManager
        collectionView.dataSource = collectionManager
        
        collectionManager?.didSelect = { [weak self] data in
            self?.didSelect?(data)
        }
    }
}

extension MeditationListCell: ConfigurableCell {
    func configure(_ data: Any?, size: CGSize) {
        guard let section = data as? MainPageSectionParser.ItemType else {
            fatalError("The model is incompatible.")
        }

        guard case let .content(contents) = section else {
          return
        }
                
        collectionManager?.set(data: [SectionViewModel(type: .content(contents: contents))])
        collectionView.reloadData()
    }
}
