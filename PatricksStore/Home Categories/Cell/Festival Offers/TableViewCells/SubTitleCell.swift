//
//  SubTitleCell.swift
//  PatricksStore
//
//  Created by Admin on 13/09/21.
//

import UIKit

class SubTitleCell: UITableViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var lblTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Title Label
        lblTitle.font = UIFont(name: "Roboto-Medium", size: 14)
        lblTitle.textColor = Helper.colorFromHexString(hex: "#262626")
    }

}
