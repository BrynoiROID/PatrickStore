//
//  ConfirmOrderPriceDetailsTVCell.swift
//  PatricksStore
//
//  Created by Admin on 22/09/21.
//

import UIKit

class ConfirmOrderPriceDetailsTVCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var lblAddChargeDetails: UILabel!
    
    @IBOutlet weak var lblServiceChargeDetails: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Add Charge Details Label
        lblAddChargeDetails.underline()
        
        // Service Charge Details Label
        lblServiceChargeDetails.underline()
    }
    
}
