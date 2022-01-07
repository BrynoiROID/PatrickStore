//
//  SixImageColViewCell.swift
//  PatricksStore
//
//  Created by Admin on 13/09/21.
//

import UIKit

class SixImageColViewCell: UICollectionViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var colorBorder: UIView!
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    //MARK: - Initial Setup
    func initialSetup() {
        colorBorder.layer.cornerRadius = colorBorder.frame.height/2
        img.layer.cornerRadius = colorBorder.frame.height/2
        img.contentMode = .scaleAspectFill
        lblTitle.font = UIFont(name: "Barlow-Medium", size: 12)
        lblTitle.textColor = Helper.colorFromHexString(hex: "#262626")
    }
    
}
