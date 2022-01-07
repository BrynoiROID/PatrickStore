//
//  clvItemTagsCell.swift
//  PatricksStore
//
//  Created by Admin on 21/10/21.
//

import UIKit

class clvItemTagsCell: UICollectionViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var vwItemTag: UIView!
    
    @IBOutlet weak var lblItemTag: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Item Tag View
        vwItemTag.layer.cornerRadius = 4.0
        vwItemTag.layer.borderWidth = 1
        vwItemTag.layer.borderColor = Helper.colorFromHexString(hex: "#8D8D8D").cgColor
    }
    
}
