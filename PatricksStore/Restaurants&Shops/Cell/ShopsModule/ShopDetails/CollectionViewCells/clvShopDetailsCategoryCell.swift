//
//  clvShopDetailsCategoryCell.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 29/09/21.
//

import UIKit

class clvShopDetailsCategoryCell: UICollectionViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var lblCategory: UILabel!
    
    @IBOutlet weak var viewCategory: UIView!
    
    @IBOutlet weak var lblProductCount: UILabel!
    
    @IBOutlet weak var imgCategoryBottom: UIImageView!
    
    @IBOutlet weak var viewCategoryWidth: NSLayoutConstraint!
    
    //MARK: - Variables and Constants
    var flag = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
