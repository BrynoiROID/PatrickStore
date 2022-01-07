//
//  productCollectionCell.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 04/01/22.
//

import UIKit

import Cosmos

import Kingfisher

class productCollectionCell: UICollectionViewCell {
    //MARK: - IB Outlets
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var ratingView: CosmosView!
    
    @IBOutlet weak var productActualRateLabel: UILabel!
    
    @IBOutlet weak var productOldRateLabel: UILabel!
    
    @IBOutlet weak var productAddToCartButton: UIButton!
    
    var productsModel : Products?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupRatingView()
        self.productDataSetup()
    }
    
    override func layoutSubviews() {
        Helper.cornerSetImageView(image: self.productImageView, radiousValue: 5.0)
        Helper.borderAndborderColourSetUIImageView(image: self.productImageView, borderWidth: 1.0, colour: .black)
        Helper.cornerSetButton(button: self.productAddToCartButton, radiousValue: 5.0)
        Helper.shadoweSetButton(button: self.productAddToCartButton)
    }
    //MARK: - StarView Setup
    func setupRatingView(){
        ratingView.settings.filledImage = UIImage(named: "rating-star-icon")
        ratingView.settings.emptyImage = UIImage(named: "rating-star-empty")
        ratingView.settings.fillMode = .half
        ratingView.settings.starSize = 15
        ratingView.settings.starMargin = 4
        ratingView.rating = 3.5
        ratingView.settings.updateOnTouch = false
        // Called when user finishes changing the rating by lifting the finger from the view.
//        ratingView.didFinishTouchingCosmos = { rating in
//
//        }
    }
    //MARK: - Setup Product View
    func productDataSetup(){
        if self.productsModel != nil{
            if let url = URL(string: self.productsModel!.imgUrl![0].publicUrl!){
                 let placeholder = UIImage(named: "placeholder")
                 let options : KingfisherOptionsInfo = [KingfisherOptionsInfoItem.transition(.fade(0.1))]
                self.productImageView.kf.indicatorType = .activity
                self.productImageView.kf.setImage(with: url, placeholder: placeholder, options: options)
             }
            self.productNameLabel.text = self.productsModel!.name
            self.productOldRateLabel.text = "₹" + String(self.productsModel!.offerPrice!)
            self.productActualRateLabel.text = "₹" + String(self.productsModel!.actualPrice!)
            
        }
    }
}
