//
//  PriceDetailsTableViewCell.swift
//  PatricksStore
//
//  Created by Admin on 15/09/21.
//

import UIKit

class PriceDetailsTableViewCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var lblSubTotal: UILabel!
    
    @IBOutlet weak var lblTax: UILabel!
    
    @IBOutlet weak var lblDeliveryCharge: UILabel!
    
    @IBOutlet weak var lblTotal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
