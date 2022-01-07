//
//  ItemsTVCell.swift
//  PatricksStore
//
//  Created by Admin on 22/09/21.
//

import UIKit

class ItemsTVCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var lblOldPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Old Price Label
        lblOldPrice.attributedText = lblOldPrice.text?.strikeThrough()
    }
    
}
