//
//  DealsofDayHeaderTblCell.swift
//  PatricksStore
//
//  Created by Admin on 14/09/21.
//

import UIKit

class DealsofDayHeaderTblCell: UITableViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var imgHeader: UIImageView!
    
    @IBOutlet weak var lblShopName: UILabel!
    
    @IBOutlet weak var lblDistanceTitle: UILabel!
    
    @IBOutlet weak var lblDistanceKM: UILabel!
    
    @IBOutlet weak var btnView: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }

    //MARK: - Initial Setup
    func initialSetup() {
        
        // Header Image
        self.imgHeader.layer.cornerRadius = 5
        
        // Shop Name Label
        self.lblShopName.font = UIFont(name: "Barlow-Medium", size: 18)
        self.lblShopName?.textColor = Helper.colorFromHexString(hex: "#262626")
        
        // Distance Title Label
        self.lblDistanceTitle.font = UIFont(name: "Roboto-Medium", size: 16)
        self.lblDistanceTitle?.textColor = Helper.colorFromHexString(hex: "#343434")
        
        // Button View
        self.btnView.layer.cornerRadius = 5
        self.btnView.titleLabel?.font =  UIFont(name: "Barlow-Medium", size: 16)
    }
}
