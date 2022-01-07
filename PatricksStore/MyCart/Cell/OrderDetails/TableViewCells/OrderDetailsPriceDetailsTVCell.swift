//
//  OrderDetailsPriceDetailsTVCell.swift
//  PatricksStore
//
//  Created by Admin on 27/09/21.
//

import UIKit

class OrderDetailsPriceDetailsTVCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var paymentMethodView: UIView!
    
    @IBOutlet weak var lblPaymentMethod: UILabel!
    
    @IBOutlet weak var lblSubTotal: UILabel!
    
    @IBOutlet weak var lblAddCharge: UILabel!
    
    @IBOutlet weak var lblServiceCharge: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Set bottom shadow
        Helper.shadowSetViewBottom(view: paymentMethodView)
    }

}
