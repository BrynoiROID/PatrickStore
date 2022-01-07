//
//  tblShopDetailsReviewsDataCell.swift
//  PatricksStore
//
//  Created by Admin on 07/10/21.
//

import UIKit
import Cosmos

class tblShopDetailsReviewsDataCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var reviewDataView: UIView!
    
    @IBOutlet weak var lblReviewTitle: UILabel!
    
    @IBOutlet weak var ratingView: CosmosView!
    
    @IBOutlet weak var lblReview: UILabel!
    
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        
        // Set bottom shadow view
        Helper.shadowSetViewBottom(view: reviewDataView)
        
        // Configure rating view
        self.ratingView.settings.fillMode = .half
    }
    
}
