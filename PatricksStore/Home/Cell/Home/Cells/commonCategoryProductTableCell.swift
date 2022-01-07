//
//  commonCategoryProductTableCell.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 03/01/22.
//

import UIKit

class commonCategoryProductTableCell: UITableViewCell {
    //MARK: - IB Outlets
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    @IBOutlet weak var bttnViewAll: UIButton!
    
    @IBOutlet weak var lblTittle: UILabel!
    
    @IBOutlet weak var productBGView: UIView!
    
    var clvIndexValue : Int = 0
    
    var shopModel  = [ShopData]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupUI()
    }
    override func layoutSubviews() {
        Helper.borderAndborderColourSetUIButton(button: self.bttnViewAll, borderWidth: 1.0, colour: .black)
        Helper.cornerSetButton(button: self.bttnViewAll, radiousValue: 15.0)
        Helper.setCornerAndShadowSetView(view: productBGView)
        productCollectionView.layer.cornerRadius = 10
        productCollectionView.clipsToBounds = true
    }
    //MARK: - Cell Data Setting
    func setupUI(){
        self.categoryCollectionView.register(UINib(nibName: "commonCategoryCollectionCell", bundle: nil), forCellWithReuseIdentifier: "commonCategoryCollectionCell")
        self.productCollectionView.register(UINib(nibName: "categoryProductCollectionCell", bundle: nil), forCellWithReuseIdentifier: "categoryProductCollectionCell")
        self.categoryCollectionView.reloadData()
        self.productCollectionView.reloadData()
    }

}
//MARK: - Collection View Delegate
extension commonCategoryProductTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //MARK: - Cell Layouts
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.categoryCollectionView{
            let label = UILabel(frame: CGRect.zero)
            label.text = self.shopModel[indexPath.row].name?.uppercased()
            label.sizeToFit()
            setNeedsLayout()
            let labelSize = label.frame.width 
            return CGSize(width: labelSize, height: 40)
        }else{
            let collectionViewWidth = collectionView.bounds.width
            return CGSize(width: collectionViewWidth/2, height: 235)
        }
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
        if collectionView == self.categoryCollectionView{
            return self.shopModel.count
        }else{
            return self.shopModel[clvIndexValue].shops?.count ?? 0
        }
    }
    //MARK: - Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.categoryCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "commonCategoryCollectionCell", for: indexPath) as! commonCategoryCollectionCell
                cell.categoryLabel.text = self.shopModel[indexPath.row].name?.uppercased()
                if self.clvIndexValue == indexPath.row{
                    cell.categorySelectedView.backgroundColor = .red
                    cell.categoryLabel.textColor = .black
                }else{
                    cell.categorySelectedView.backgroundColor = .clear
                    cell.categoryLabel.textColor = UIColor(named: "UnSelectColour")
                }
                cell.awakeFromNib()
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryProductCollectionCell", for: indexPath) as! categoryProductCollectionCell
                cell.shopsModel = self.shopModel[clvIndexValue].shops![indexPath.row]
                cell.awakeFromNib()
            return cell
        }
    }
    //MARK: - Cell Selection
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.categoryCollectionView{
            self.clvIndexValue = indexPath.row
            self.categoryCollectionView.reloadData()
            self.productCollectionView.reloadData()
        }else{
            
        }
    }
}
