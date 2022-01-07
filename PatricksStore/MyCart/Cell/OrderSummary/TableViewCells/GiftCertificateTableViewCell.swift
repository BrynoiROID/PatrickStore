//
//  GiftCertificateTableViewCell.swift
//  PatricksStore
//
//  Created by Admin on 21/09/21.
//

import UIKit

class GiftCertificateTableViewCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var giftView: UIView!
    
    @IBOutlet weak var giftCodeView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Set bottom shadow
        Helper.shadowSetViewBottom(view: giftView)
        
        // Gift Code View
        giftCodeView.layer.borderColor = Helper.colorFromHexString(hex: "#707070").cgColor
        giftCodeView.layer.borderWidth = 1
    }
}
