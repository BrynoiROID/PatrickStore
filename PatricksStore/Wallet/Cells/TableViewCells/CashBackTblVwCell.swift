//
//  CashBackTblVwCell.swift
//  PatricksStore
//
//  Created by Admin on 22/09/21.
//

import UIKit

class CashBackTblVwCell: UITableViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var vwMain: UIView!
    
    @IBOutlet weak var imgItem: UIImageView!
    
    @IBOutlet weak var lblItemName: UILabel!
    
    @IBOutlet weak var lblModel: UILabel!
    
    @IBOutlet weak var lblModelDesp: UILabel!
    
    @IBOutlet weak var lblQuanity: UILabel!
    
    @IBOutlet weak var lblQuantityDetail: UILabel!
    
    @IBOutlet weak var lblPercentage: UILabel!
    
    @IBOutlet weak var lblCashBack: UILabel!
    
    @IBOutlet weak var lblStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }

    //MARK: - Initial Setup
    func initialSetup() {
        
        // Set Bottom Shadow
        Helper.shadowSetViewBottom(view: self.vwMain)
        
        // Item Image
        self.imgItem.layer.borderWidth = 1
        self.imgItem.layer.borderColor = Helper.colorFromHexString(hex: "#95989A").cgColor
        self.imgItem.clipsToBounds = true
        
        // Item Name Label
        self.lblItemName.font = UIFont(name: "Barlow-SemiBold", size: 17)
        self.lblItemName.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.87)
        
        // Model Label
        self.lblModel.font = UIFont(name: "Barlow-Regular", size: 14)
        self.lblModel.textColor = Helper.colorFromHexString(hex: "#262626")
        
        // Mode Description Label
        self.lblModelDesp.font = UIFont(name: "Barlow-Regular", size: 14)
        self.lblModelDesp.textColor = Helper.colorFromHexString(hex: "#262626")
        
        // Quantity Label
        self.lblQuanity.font = UIFont(name: "Barlow-Regular", size: 14)
        self.lblQuanity.textColor = Helper.colorFromHexString(hex: "#262626")
        
        // Quantity Detail Label
        self.lblQuantityDetail.font = UIFont(name: "Barlow-Bold", size: 14)
        self.lblQuantityDetail.textColor = Helper.colorFromHexString(hex: "#262626")
        
        // Percentage Label
        self.lblPercentage.font = UIFont(name: "Barlow-Regular", size: 14)
        self.lblPercentage.textColor = Helper.colorFromHexString(hex: "#343434")
        
        // Cashback Label
        self.lblCashBack.font = UIFont(name: "Barlow-Regular", size: 14)
        self.lblCashBack.textColor = Helper.colorFromHexString(hex: "#343434")
        
        // Status Label
        self.lblStatus.font = UIFont(name: "Barlow-Medium", size: 14)
        self.lblStatus.textColor = Helper.colorFromHexString(hex: "#00970F")
    }

}
