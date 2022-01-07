//
//  WholesaleTblCell.swift
//  PatricksStore
//
//  Created by Admin on 16/09/21.
//

import UIKit

class WholesaleTblCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var imgLogo: UIImageView!
    
    @IBOutlet weak var lblShopName: UILabel!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblQuantity: UILabel!
    
    @IBOutlet weak var lblProducts: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Shop Name Label
        self.lblShopName.font = UIFont(name: "Barlow-Medium", size: 16)
        self.lblShopName?.textColor = Helper.colorFromHexString(hex: "#262626")
        
        // Address Label
        self.lblAddress.font = UIFont(name: "Barlow-Regular", size: 16)
        self.lblAddress?.textColor = Helper.colorFromHexString(hex: "#262626")
        
        // Quantity Label
        self.lblQuantity.font = UIFont(name: "Barlow-SemiBold", size: 13)
        self.lblQuantity?.textColor = Helper.colorFromHexString(hex: "#262626")
        
        // Products Label
        self.lblProducts.font = UIFont(name: "Barlow-Regular", size: 13)
        self.lblProducts?.textColor = Helper.colorFromHexString(hex: "#262626")

    }

}
