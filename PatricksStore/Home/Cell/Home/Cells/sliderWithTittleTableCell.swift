//
//  sliderWithTittleTableCell.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 30/12/21.
//

import UIKit

class sliderWithTittleTableCell: UITableViewCell {
    //MARK: - IB Outlets
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var tittleLabel: UILabel!
    
    @IBOutlet weak var backView: UIView!
    
    var sliderModel = [Banner]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupUI()
    }
    override func layoutSubviews() {
        collectionViewHeightConstraint.constant = sliderCollectionView.contentSize.height
        Helper.shadoweSetView(view: self.backView)
        super.layoutSubviews()
    }
    private func updateUI() {
        layoutIfNeeded()
    }
    //MARK: - Cell Data Setting
    func setupUI(){
        self.sliderCollectionView.register(UINib(nibName: "sliderWithTittleCollectionCell", bundle: nil), forCellWithReuseIdentifier: "sliderWithTittleCollectionCell")
        self.sliderCollectionView.reloadData()
    }
}
//MARK: - CollectionView DataSource and Delegate
extension sliderWithTittleTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //MARK: - Cell Layouts
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = UIScreen.main.bounds.width/3 - 15
        return CGSize(width: collectionViewWidth, height: 140)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
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
        return self.sliderModel.count
    }
    //MARK: - Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: "sliderWithTittleCollectionCell", for: indexPath) as! sliderWithTittleCollectionCell
        let currentModel = self.sliderModel[indexPath.row]
            cell.sliderImageView.kf.setImage(with: URL(string: currentModel.mainImage!.publicUrl!))
            cell.awakeFromNib()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }


}
