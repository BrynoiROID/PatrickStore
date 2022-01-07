//
//  tblWishListCell.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 27/09/21.
//

import UIKit

//MARK: - Current Wishlist Protocol
protocol currentWishlistButtonTapDelegate {
    
    func removeCartButtonSelection()
    
    func addCartButtonSelection()
}

class tblWishListCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var viewBG: UIView!
    
    @IBOutlet weak var viewImageBorder: UIView!
    
    @IBOutlet weak var imgProduct: UIView!
    
    @IBOutlet weak var viewRating: UIView!
    
    @IBOutlet weak var lblProductName: UILabel!
    
    @IBOutlet weak var lblProductRating: UILabel!
    
    @IBOutlet weak var lblProductReview: UILabel!
    
    @IBOutlet weak var lblProductSellingPrice: UILabel!
    
    @IBOutlet weak var lblProductActualPrice: UILabel!
    
    @IBOutlet weak var lblProductOffer: UILabel!
    
    @IBOutlet weak var bttnRemoveCart: UIButton!
    
    @IBOutlet weak var bttnAddCart: UIButton!
    
    //MARK: - Variables and Constants
    var buttonSelectionDelegate : currentWishlistButtonTapDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }

    // MARK: - Initial Setup
    func initialSetup() {
        
        // Set bottom shadow for view
        Helper.shadowSetViewBottom(view: self.viewBG)
        
        // Set border width and border color
        Helper.borderAndborderColourSetUIView(view: self.viewImageBorder, borderWidth: 1.0, colour: .black)
        
        // Set corner radius
        Helper.cornerSetView(view: self.viewRating, radiousValue: 15.0)
        
        // Strikethrough Label
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: (self.lblProductActualPrice.text!))
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        self.lblProductActualPrice.attributedText = attributeString
    }
    
    // MARK: - Edit Button Action
    @IBAction func removeCartButtonTapped(_ sender: UIButton) {
        self.buttonSelectionDelegate.removeCartButtonSelection()
    }
    
    // MARK: - Delete Button Action
    @IBAction func addCartButtonTapped(_ sender: UIButton) {
        self.buttonSelectionDelegate.addCartButtonSelection()
    }
}
