//
//  ItemTagsCell.swift
//  PatricksStore
//
//  Created by Admin on 21/10/21.
//

import UIKit

// Item Tag Cell Height Protocol
protocol itemTagsCellHeightDelegate {
    func sendData(height: CGFloat)
}

class ItemTagsCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var clvItemTags: UICollectionView!
    
    @IBOutlet weak var clvItemTagsHeight: NSLayoutConstraint!
    
    @IBOutlet weak var lblSizeChart: UILabel!
    
    //MARK: - Variables and Constants
    var itemTagsArray = ["HEADPHONES","MOUSE"]
    
    var itemTagDelegate: itemTagsCellHeightDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let cellHeight = clvItemTags.collectionViewLayout.collectionViewContentSize.height + 20.0
        self.itemTagDelegate?.sendData(height: cellHeight)
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        clvItemTags.delegate = self
        clvItemTags.dataSource = self
    }

}

// MARK: - CollectionView Logic
extension ItemTagsCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemTagsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "clvItemTagsCell", for: indexPath) as! clvItemTagsCell
        cell.lblItemTag.text = itemTagsArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: itemTagsArray[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont(name:"Roboto-Regular", size:10)!]).width + 22, height: 42)
    }
        
}
