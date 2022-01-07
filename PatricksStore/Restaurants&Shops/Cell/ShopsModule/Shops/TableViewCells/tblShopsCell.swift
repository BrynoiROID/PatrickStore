//
//  tblShopsCell.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 28/09/21.
//

import UIKit

class tblShopsCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var viewBG: UIView!
    
    @IBOutlet weak var imgProduct: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }

    //MARK: - Initial Setup
    func initialSetup() {
        
        // Setup shadow for view
        Helper.shadoweSetView(view: self.viewBG)
        
        // Setup shadow for image
        Helper.shadoweSetImageView(image: self.imgProduct)
    }
}
