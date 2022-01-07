//
//  tblShopDetailsProductCells.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 29/09/21.
//

import UIKit

class tblShopDetailsProductCells: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var clvProducts: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        clvProducts.layoutIfNeeded()
        clvProducts.frame = CGRect(x: 0, y: 0, width: targetSize.width , height: 1)
        return clvProducts.collectionViewLayout.collectionViewContentSize
    }
}

//MARK: - Collection View Logic
extension tblShopDetailsProductCells: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Cell Layouts
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let collectionViewHeight = collectionView.bounds.height
        return CGSize(width: collectionViewWidth/2 - 10, height: collectionViewHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        // give space top left bottom and right for cells
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    //MARK: - Rows
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    //MARK: - Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "clvShopDetailsProductCell", for: indexPath) as! clvShopDetailsProductCell
            cell.awakeFromNib()
        return cell
    }
    
    //MARK: - Cell Selection
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
