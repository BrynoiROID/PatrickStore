//
//  BusinessStoresColVwCell.swift
//  PatricksStore
//
//  Created by Admin on 17/09/21.
//

import UIKit

class BusinessStoresColVwCell: UICollectionViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var imgSelected: UIImageView!
    
    //MARK: - Variables and Constants
    var flag = false
    
    //MARK: - Initial Setup
    func initialSetupToCell() {
        self.lblTitle.font = UIFont(name: "Barlow-Medium", size: 16.0)
        self.lblTitle.textColor = Helper.colorFromHexString(hex: "#262626")
        self.imgSelected.alpha = (flag ? 1 : 0)
    }
}
