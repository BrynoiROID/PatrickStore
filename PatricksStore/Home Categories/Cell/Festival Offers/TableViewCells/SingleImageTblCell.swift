//
//  SingleImageTblCell.swift
//  PatricksStore
//
//  Created by Admin on 13/09/21.
//

import UIKit

class SingleImageTblCell: UITableViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var imgSingle: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Set Image
        self.imgSingle.image = UIImage(named: "color-keyboard")
    }
}
