//
//  OrderDetailsShippingAddressTVCell.swift
//  PatricksStore
//
//  Created by Admin on 27/09/21.
//

import UIKit

class OrderDetailsShippingAddressTVCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var addressView: UIView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var btnAddressType: UIButton!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblContactNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Set bottom shadow
        Helper.shadowSetViewBottom(view: addressView)
    }

}
