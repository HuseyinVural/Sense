//
//  CollectionManager.swift
//  Sense
//
//  Created by Hüseyin Vural on 4.04.2021.
//

import UIKit

class CollectionManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private var data: [SectionViewModel] = []
    var didSelect: ((_ info: Any?) -> Void)?
    
    func set(data: [SectionViewModel]) {
        self.data = data
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].numberOfSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionModel = data[indexPath.section]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sectionModel.cellId, for: indexPath)
        
        if let configurable = cell as? ConfigurableCell {
            let size = sectionModel.size(bounds: collectionView.bounds.size)
            let info = sectionModel.itemInfo(indexPath.row)
            configurable.configure(info, size: size)
        }
        
        if let selectable = cell as? SelectableCell {
            selectable.didSelect = didSelect
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        data[indexPath.section].size(bounds: collectionView.bounds.size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelect?(data[indexPath.section].itemInfo(indexPath.row))
    }
}
