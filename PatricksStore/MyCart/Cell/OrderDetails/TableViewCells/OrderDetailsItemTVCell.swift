//
//  OrderDetailsItemTVCell.swift
//  PatricksStore
//
//  Created by Admin on 24/09/21.
//

import UIKit

class OrderDetailsItemTVCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var vwItem: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Set bottom shadow
        Helper.shadowSetViewBottom(view: vwItem)
    }
 
}
