//
//  PatricksStoreWalletTableViewCell.swift
//  PatricksStore
//
//  Created by Admin on 21/09/21.
//

import UIKit

class PatricksStoreWalletTableViewCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var walletView: UIView!
    
    @IBOutlet weak var lblWalletBalance: UILabel!
    
    @IBOutlet weak var lblWalletCash: UILabel!
    
    @IBOutlet weak var imgRadioButton: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Set bottom shadow
        Helper.shadowSetViewBottom(view: walletView)
    }
    
}
