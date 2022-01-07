//
//  ReferralCodeTableViewCell.swift
//  PatricksStore
//
//  Created by Admin on 21/09/21.
//

import UIKit

class ReferralCodeTableViewCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var referralView: UIView!
    
    @IBOutlet weak var codeView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Set bottom shadow
        Helper.shadowSetViewBottom(view: referralView)
        
        // Code View
        codeView.layer.borderColor = Helper.colorFromHexString(hex: "#707070").cgColor
        codeView.layer.borderWidth = 1
    }
   
}
