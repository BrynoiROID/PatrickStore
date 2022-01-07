//
//  SideCategoryCell.swift
//  PatricksStore
//
//  Created by Admin on 08/09/21.
//

import UIKit

class SideCategoryCell: UITableViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var lblItemName: UILabel!
    
    @IBOutlet weak var vwBackground: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Item Name Label
        self.lblItemName.font = UIFont(name: "Barlow-Regular", size: 14)
        self.lblItemName.textColor = Helper.colorFromHexString(hex: "#262626")
    }

}
