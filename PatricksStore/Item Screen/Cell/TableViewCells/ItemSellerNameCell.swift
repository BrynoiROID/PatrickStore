//
//  ItemSellerNameCell.swift
//  PatricksStore
//
//  Created by Admin on 22/10/21.
//

import UIKit

class ItemSellerNameCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var lblReviewCount: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Reviews Count Label
        lblReviewCount.underline()
    }

}
