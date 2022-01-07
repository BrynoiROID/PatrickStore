//
//  commonCategoryCollectionCell.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 03/01/22.
//

import UIKit

class commonCategoryCollectionCell: UICollectionViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var categorySelectedView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
