//
//  ItemImageSnap.swift
//  PatricksStore
//
//  Created by Admin on 24/09/21.
//

import UIKit

class ItemImageSnap: UICollectionViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var vwBackground: UIView!
    
    @IBOutlet weak var imgItem: UIImageView!
    
    //MARK: - Cell Selection
    func setupCellSelection(){
        self.vwBackground.layer.borderWidth = 1
        self.vwBackground.layer.borderColor = Helper.colorFromHexString(hex: "#039508").cgColor
    }
    
    //MARK: - Cell Deselection
    func setupCellDeSelection(){
        self.vwBackground.layer.borderWidth = 1
        self.vwBackground.layer.borderColor = Helper.colorFromHexString(hex: "#AFAFAF").cgColor
    }
}
