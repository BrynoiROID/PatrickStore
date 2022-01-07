//
//  DealsofDayColVwCell.swift
//  PatricksStore
//
//  Created by Admin on 15/09/21.
//

import UIKit

import Cosmos

class DealsofDayColVwCell: UICollectionViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var lblItemName: UILabel!
    
    @IBOutlet weak var lblNewPrice: UILabel!
    
    @IBOutlet weak var lblOldPrice: UILabel!
    
    @IBOutlet weak var vwAddToCart: UIView!
    
    @IBOutlet weak var btnAddToCart: UIButton!
    
    @IBOutlet weak var lblAddToCart: UILabel!
    
    @IBOutlet weak var ratingView: CosmosView!
    
    //MARK: - Setup Data to UI
    func setUpUI(){
        
        // Item Name Label
        lblItemName.font = UIFont(name: "Roboto-Medium", size: 12)
        lblItemName?.textColor = Helper.colorFromHexString(hex: "#262626")
        
        // Rating View
        ratingView.settings = .default
        ratingView.settings.fillMode = .precise
        ratingView.settings.updateOnTouch = false
        
        // New Price Label
        lblNewPrice.font = UIFont(name: "Barlow-SemiBold", size: 16)
        lblNewPrice?.textColor = Helper.colorFromHexString(hex: "#262626")
        
        // Old Price Label
        lblOldPrice.font = UIFont(name: "Barlow-Regular", size: 12)
        lblOldPrice?.textColor = Helper.colorFromHexString(hex: "929292")
        lblOldPrice.attributedText = lblOldPrice.text?.strikeThrough()
        
        // Add to Cart Label
        lblAddToCart.font = UIFont(name: "Barlow-Medium", size: 13)
        lblAddToCart?.textColor = Helper.colorFromHexString(hex: "#FFFFFF")
        
        // Add to Cart View
        vwAddToCart.layer.cornerRadius = 5.0
    }
    
}

