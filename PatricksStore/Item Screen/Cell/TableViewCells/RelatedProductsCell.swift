//
//  RelatedProductsCell.swift
//  PatricksStore
//
//  Created by Admin on 10/11/21.
//

import UIKit

class RelatedProductsCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var itemView: UIView!
    
    @IBOutlet weak var clvRelatedProducts: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        
        // Set Bottom Shadow for Item View
        Helper.shadowSetViewBottom(view: self.itemView)
        
        // Related Products Collection View
        clvRelatedProducts.dataSource = self
        clvRelatedProducts.delegate = self
        
        // Set Horizontal Layout for Collection View
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.clvRelatedProducts.collectionViewLayout = layout
        
        // Hide Scroll Indicator
        self.clvRelatedProducts.showsHorizontalScrollIndicator = false
    }

    //MARK: - Button Taps
    
    // Add to Cart Button Action
    @IBAction func btnAddToCartTapped(_ sender: UIButton) {
        let btnIndex = sender.convert(sender.bounds.origin, to: self.clvRelatedProducts)
        
        if let indexPath = self.clvRelatedProducts.indexPathForItem(at: btnIndex) {
            print("Button Clicked at \(indexPath.item) Index")
        }
    }

}

//MARK: - Collection View Logic
extension RelatedProductsCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "clvRelatedProductsCell", for: indexPath) as! clvRelatedProductsCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (clvRelatedProducts.bounds.width / 2) - 22, height: 281.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
}
