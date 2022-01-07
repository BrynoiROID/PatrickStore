//
//  colVwWalletCell.swift
//  PatricksStore
//
//  Created by Admin on 20/09/21.
//

import UIKit

class colVwWalletCell: UICollectionViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var imgSelectedTile: UIImageView!
    
    //MARK: - Variables and Constants
    var flag = false
    
    //MARK: - Initial SetUp
    func initialSetup() {
        self.lblTitle.font = UIFont(name: "Barlow-Medium", size: 18)
        self.lblTitle.textColor = Helper.colorFromHexString(hex: "#343434")
        self.imgSelectedTile.alpha = (flag ? 1 : 0)
    }
    
}
