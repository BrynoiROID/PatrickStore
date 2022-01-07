//
//  StoreItemTableViewCell.swift
//  PatricksStore
//
//  Created by Admin on 10/09/21.
//

import UIKit

class StoreItemTableViewCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var productView: UIView!
    
    @IBOutlet weak var quantityView: UIView!
    
    @IBOutlet weak var lblQuantity: UILabel!
    
    @IBOutlet weak var sizeView: UIView!
    
    @IBOutlet weak var innerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Product View
        productView.layer.borderWidth = 1
        productView.layer.borderColor = Helper.colorFromHexString(hex: "#95989A").cgColor
        
        // Quantity View
        quantityView.layer.borderWidth = 1.0
        quantityView.layer.borderColor = Helper.colorFromHexString(hex: "#707070").cgColor
        quantityView.layer.cornerRadius = 4.0
        quantityView.backgroundColor = .white
        
        // Quantity Label
        lblQuantity.textColor = Helper.colorFromHexString(hex: "262626")

        // Size View
        sizeView.layer.borderWidth = 1.0
        sizeView.layer.borderColor = Helper.colorFromHexString(hex: "#707070").cgColor
        sizeView.layer.cornerRadius = 4.0
        
        // Set bottom shadow
        Helper.shadowSetViewBottom(view: innerView)
    }

}
