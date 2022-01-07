//
//  ShippingAddressTableViewCell.swift
//  PatricksStore
//
//  Created by Admin on 22/09/21.
//

import UIKit

class ShippingAddressTableViewCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var shippingAddressView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    // MARK: - Initial Setup
    func initialSetup() {
        // Set bottom shadow
        Helper.shadowSetViewBottom(view: shippingAddressView)
    }
 
}
