//
//  tblMyOrderCell.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 27/09/21.
//

import UIKit

class tblMyOrderCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var lblOrderDate: UILabel!
    
    @IBOutlet weak var viewBG: UIView!
    
    @IBOutlet weak var lblOrderID: UILabel!
    
    @IBOutlet weak var lblDelivered: UILabel!
    
    @IBOutlet weak var lblItems: UILabel!
    
    @IBOutlet weak var lblStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }

    // MARK: - Initial Setup
    func initialSetup() {
        // Set Bottom Shadow for view
        Helper.shadowSetViewBottom(view: self.viewBG)
    }
}
