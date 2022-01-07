//
//  ThreeCustomCellLayoutVertical.swift
//  PatricksStore
//
//  Created by Admin on 30/08/21.
//

import UIKit

class FourCustomCellLayoutHorizontal: UICollectionViewFlowLayout {

    var numberOfColumns:CGFloat = 4.0
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    override var itemSize: CGSize {
        set { }
        get {
            let itemWidth = (self.collectionView!.frame.width - (self.numberOfColumns - 1)) / self.numberOfColumns
            return CGSize(width: itemWidth, height: 120.0)
        }
    }
    
    func setupLayout() {
        minimumInteritemSpacing = 1 // Set to zero if you want
        minimumLineSpacing = 1
        scrollDirection = .horizontal
    }
}
