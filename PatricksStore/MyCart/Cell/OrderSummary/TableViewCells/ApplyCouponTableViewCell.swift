//
//  ApplyCouponTableViewCell.swift
//  PatricksStore
//
//  Created by Admin on 20/09/21.
//

import UIKit

class ApplyCouponTableViewCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var couponView: UIView!
    
    @IBOutlet weak var codeView: UIView!
    
    @IBOutlet weak var couponContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Code View
        codeView.layer.borderColor = Helper.colorFromHexString(hex: "#707070").cgColor
        codeView.layer.borderWidth = 1
        
        // Set bottom shadow
        Helper.shadowSetViewBottom(view: couponContainerView)
        
        // Coupon View
        couponView.addBorder(.top, color: UIColor(red: 146/255, green: 92/255, blue: 19/255, alpha: 0.34), thickness: 1)
    }

}


