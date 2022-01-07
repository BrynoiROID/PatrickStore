//
//  tblShopDetailsReviewsHeaderCell.swift
//  PatricksStore
//
//  Created by Admin on 07/10/21.
//

import UIKit
import Cosmos

class tblShopDetailsReviewsHeaderCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var lblRatingSummary: UILabel!
    
    @IBOutlet weak var lblAverageRating: UILabel!
    
    @IBOutlet weak var ratingView: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Configure rating view
        self.ratingView.settings.fillMode = .half
    }

}
