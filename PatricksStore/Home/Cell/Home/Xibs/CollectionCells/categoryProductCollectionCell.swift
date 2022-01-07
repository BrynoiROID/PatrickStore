//
//  categoryProductCollectionCell.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 03/01/22.
//

import UIKit

class categoryProductCollectionCell: UICollectionViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var productPicView: UIView!
    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var productLocationLabel: UILabel!
    
    @IBOutlet weak var productQtyLabel: UILabel!
    
    var shopsModel : Shops?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupUI()
        self.shopDataSetup()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        Helper.cornerSetImageView(image: self.productImageView, radiousValue: 10)
        Helper.setCornerAndShadowSetView(view: productPicView)
    }
    func setupUI(){

    }
    //MARK: - Setup Shops View
    func shopDataSetup(){
        if self.shopsModel != nil{
            self.productImageView.kf.setImage(with: URL(string: self.shopsModel!.profileImageId!.publicUrl!))
            self.productNameLabel.text = self.shopsModel!.sellerName
        }
    }
}
