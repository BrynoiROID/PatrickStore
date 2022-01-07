//
//  PaymentMethodTableViewCell.swift
//  PatricksStore
//
//  Created by Admin on 13/10/21.
//

import UIKit

class PaymentMethodTableViewCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var paymentMethodView: UIView!
    
    @IBOutlet weak var vwCashOnDelivery: UIView!
    
    @IBOutlet weak var vwOnlinePayment: UIView!
    
    @IBOutlet weak var btnCODCheckbox: UIButton!
    
    @IBOutlet weak var btnOPCheckbox: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        
        // Payment Method View
        Helper.shadowSetViewBottom(view: paymentMethodView)
        paymentMethodView.addBorder(.top, color: Helper.systemGray5Equal, thickness: 2)
        
        // Cash On Delivery Checkbox
        vwCashOnDelivery.backgroundColor = .white
        vwCashOnDelivery.layer.borderWidth = 1
        vwCashOnDelivery.layer.borderColor = Helper.colorFromHexString(hex: Helper.appThemeColor).cgColor
        
        // Online Payment Checkbox
        vwOnlinePayment.backgroundColor = .white
        vwOnlinePayment.layer.borderWidth = 1
        vwOnlinePayment.layer.borderColor = Helper.colorFromHexString(hex: Helper.appThemeColor).cgColor
    }

}
