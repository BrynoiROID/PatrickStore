//
//  SixImgCell.swift
//  PatricksStore
//
//  Created by Admin on 13/09/21.
//

import UIKit

class SixImgCell: UITableViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var colVwSixImg: UICollectionView!
    
    //MARK: - Variables and Constants
    var imgForCell: UIImage = UIImage(named: "Big Deals")!

    override func awakeFromNib() {
        super.awakeFromNib()
        colVwSixImg.reloadData()
    }
}

//MARK: - Collection View Logic
extension SixImgCell: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SixImageColViewCell", for: indexPath) as! SixImageColViewCell
        cell.img.image = UIImage(named: "iphone")
        cell.lblTitle.text = "Casual Shoes"
        cell.initialSetup()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthCell = CGFloat(colVwSixImg.bounds.width)/3
        let heightCell = CGFloat(colVwSixImg.bounds.height)/2 - 40
        return CGSize(width: widthCell, height: heightCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

