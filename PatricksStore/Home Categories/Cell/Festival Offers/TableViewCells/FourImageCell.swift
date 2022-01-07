//
//  FourImageCell.swift
//  PatricksStore
//
//  Created by Admin on 13/09/21.
//

import UIKit

class FourImageCell: UITableViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var colVwFourImg: UICollectionView!
    
    //MARK: - Variables and Constants
    var imgForCell: UIImage = UIImage(named: "Big Deals")!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Collection View
        colVwFourImg.reloadData()
    }
}

//MARK: - Collection View Logic
extension FourImageCell: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TwoImgCollectionCell", for: indexPath) as! TwoImgCollectionCell
        cell.imgTwoCell.image = imgForCell
        cell.intialSetup()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = CGFloat( colVwFourImg.bounds.width)/2 - 15
        let height = CGFloat(colVwFourImg.bounds.height)/2 - 12
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 10, bottom: 1, right: 10)
    }
}
