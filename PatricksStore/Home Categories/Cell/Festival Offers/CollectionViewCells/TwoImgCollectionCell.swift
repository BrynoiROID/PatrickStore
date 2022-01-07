//
//  TwoImgCollectionCell.swift
//  PatricksStore
//
//  Created by Admin on 10/09/21.
//

import UIKit

class TwoImgCollectionCell: UICollectionViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var imgTwoCell: UIImageView!
    
    //MARK: - Initial Setup
    func intialSetup() {
        imgTwoCell.layer.cornerRadius = 5
        imgTwoCell.clipsToBounds = true
        imgTwoCell.layer.masksToBounds = true
    }
}
