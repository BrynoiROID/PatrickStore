//
//  clvRelatedProductsCell.swift
//  PatricksStore
//
//  Created by Admin on 10/11/21.
//

import UIKit
import Cosmos

class clvRelatedProductsCell: UICollectionViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var productView: UIView!
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var lblProductName: UILabel!
    
    @IBOutlet weak var viewRating: CosmosView!
    
    @IBOutlet weak var lblNewPrice: UILabel!
    
    @IBOutlet weak var lblOldPrice: UILabel!
    
    @IBOutlet weak var btnAddToCart: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        
        // Setup Border of Product View
        self.productView.layer.borderWidth = 1
        self.productView.layer.borderColor = Helper.colorFromHexString(hex: "#C9C9C9").cgColor
        self.productView.layer.cornerRadius = 4.0
        
        // Rating View
        self.viewRating.settings.fillMode = .half
        
        // Strikethrough Old Price
        self.lblOldPrice.attributedText = self.lblOldPrice.text?.strikeThrough()
        
    }
    
}
