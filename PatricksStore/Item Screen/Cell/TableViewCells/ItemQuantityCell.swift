//
//  ItemQuantityCell.swift
//  PatricksStore
//
//  Created by Admin on 30/09/21.
//

import UIKit

class ItemQuantityCell: UITableViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var lblQuantity: UILabel!
    
    @IBOutlet weak var lblsize: UILabel!
    
    @IBOutlet weak var vwQuantity: UIView!
    
    @IBOutlet weak var vwSize: UIView!
    
    @IBOutlet weak var lblQuantityValue: UILabel!
    
    @IBOutlet weak var lblSizeValue: UILabel!
    
    //MARK: - Variables and Constants
    var quantityValue = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        
        // Quantity View
        vwQuantity.backgroundColor = .white
        vwQuantity.layer.cornerRadius = 4.0
        vwQuantity.layer.borderWidth = 1
        vwQuantity.layer.borderColor = Helper.colorFromHexString(hex: "#707070").cgColor
        
        // Size View
        vwSize.backgroundColor = .white
        vwSize.layer.cornerRadius = 4.0
        vwSize.layer.borderWidth = 1
        vwSize.layer.borderColor = Helper.colorFromHexString(hex: "#707070").cgColor
    }

    //MARK: - Button Actions
    
    // Decrease Quantity Button Action
    @IBAction func btnAcnQuantityDecrease(_ sender: UIButton) {
        if quantityValue != 0 {
            quantityValue -= 1
            lblQuantityValue.text = String(quantityValue)
        }
    }
    
    // Increase Quantity Button Action
    @IBAction func btnACnQuantityIncrease(_ sender: UIButton) {
        if quantityValue >= 0 {
            quantityValue += 1
            lblQuantityValue.text = String(quantityValue)
        }
    }
    
}
