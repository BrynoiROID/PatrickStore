//
//  clvShopDetailsProductCell.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 29/09/21.
//

import UIKit

class clvShopDetailsProductCell: UICollectionViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var viewProductImage: UIView!
    
    @IBOutlet weak var imgProduct: UIImageView!
    
    @IBOutlet weak var lblProductName: UILabel!
    
    @IBOutlet weak var lblProductSellingPrice: UILabel!
    
    @IBOutlet weak var lblProductActualPrice: UILabel!
    
    @IBOutlet weak var viewAddToCart: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        
        // Set Border and Border Color for View
        Helper.borderAndborderColourSetUIView(view: self.viewProductImage, borderWidth: 1.0, colour: .black)
        
        // Set corner radius for view
        Helper.cornerSetView(view: self.viewProductImage, radiousValue: 5.0)
        Helper.cornerSetView(view: self.viewAddToCart, radiousValue: 5.0)
    }
}
