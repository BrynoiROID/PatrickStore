//
//  TwoCustomCellLayoutHorizontal.swift
//  PatricksStore
//
//  Created by Admin on 30/08/21.
//

import UIKit

class TwoCustomCellLayoutHorizontal: UICollectionViewFlowLayout {

    var numberOfColumns:CGFloat = 2.0
    
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
            return CGSize(width: itemWidth, height: itemWidth)
        }
    }
    
    func setupLayout() {
        minimumInteritemSpacing = 1 // Set to zero if you want
        minimumLineSpacing = 1
        scrollDirection = .horizontal
    }
}
