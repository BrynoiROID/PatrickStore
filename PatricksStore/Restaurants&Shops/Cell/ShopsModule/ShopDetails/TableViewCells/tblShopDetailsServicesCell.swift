//
//  tblShopDetailsServicesCell.swift
//  PatricksStore
//
//  Created by Admin on 04/10/21.
//

import UIKit

class tblShopDetailsServicesCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var imgService: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblDiscountedPrice: UILabel!
    
    @IBOutlet weak var lblActualPrice: UILabel!
    
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Strikethrough Actual Price Label
        lblActualPrice.attributedText = lblActualPrice.text?.strikeThrough()
    }
    
}
