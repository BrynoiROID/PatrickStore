//
//  DealsofDayImageTableviewCell.swift
//  PatricksStore
//
//  Created by Admin on 15/09/21.
//

import UIKit

//MARK: - Button Tap Delegate
protocol dealsOfDayButtonTapDelegate {
    func addToCartButtonSelection()
}

class DealsofDayImageTableviewCell: UITableViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var colvwImg: UICollectionView!
    
    //MARK: - Variables and Constants
    var buttonSelectionDelegate: dealsOfDayButtonTapDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - Button Actions
    
    // Add To Cart Button Action
    @IBAction func btnAcnAddToCart(_ sender: UIButton) {
        self.buttonSelectionDelegate?.addToCartButtonSelection()
    }
  
}

//MARK: - Table View Logic
extension DealsofDayImageTableviewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DealsofDayColVwCell", for: indexPath) as! DealsofDayColVwCell
        cell.setUpUI()
        cell.ratingView.rating = 3.5
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizeWidth = CGFloat(collectionView.bounds.width/2 - 25)
        let sizeHeight = CGFloat(collectionView.bounds.height - 25)
        return CGSize(width: sizeWidth, height: sizeHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        // give space top left bottom and right for cells
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}
