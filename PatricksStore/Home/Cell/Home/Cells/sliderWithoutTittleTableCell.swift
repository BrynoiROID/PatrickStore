//
//  sliderWithoutTittleTableCell.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 30/12/21.
//

import UIKit

import Kingfisher

class sliderWithoutTittleTableCell: UITableViewCell {
    //MARK: - IB Outlets
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    var sliderModel = [Banner]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupUI()
    }
    //MARK: - Cell Data Setting
    func setupUI(){
        self.sliderCollectionView.register(UINib(nibName: "sliderWithOutTittleCell", bundle: nil), forCellWithReuseIdentifier: "sliderWithOutTittleCell")
        self.sliderCollectionView.isPagingEnabled = true
    }
}
//MARK: - Collection View Delegate
extension sliderWithoutTittleTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //MARK: - Cell Layouts
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        return CGSize(width: collectionViewWidth/2 - 10 , height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        // give space top left bottom and right for cells
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
    }
    //MARK: - Rows
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sliderModel.count
    }
    //MARK: - Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderWithOutTittleCell", for: indexPath) as! sliderWithOutTittleCell
        let currentModel = self.sliderModel[indexPath.row]
            cell.sliderImageView.kf.setImage(with: URL(string: currentModel.mainImage!.publicUrl!))
            cell.awakeFromNib()
        return cell
    }
    //MARK: - Cell Selection
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
