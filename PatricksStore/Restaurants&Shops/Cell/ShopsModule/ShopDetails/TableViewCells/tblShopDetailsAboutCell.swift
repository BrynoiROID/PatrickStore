//
//  tblShopDetailsAboutCell.swift
//  PatricksStore
//
//  Created by Admin on 04/10/21.
//

import UIKit

class tblShopDetailsAboutCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var lblDescriptionHeight: NSLayoutConstraint!
    
    @IBOutlet weak var lblLocation: UILabel!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var lblMobileNumber: UILabel!
    
    @IBOutlet weak var btnReadMore: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Make button underlined
        btnReadMore.underline()
    }

}
