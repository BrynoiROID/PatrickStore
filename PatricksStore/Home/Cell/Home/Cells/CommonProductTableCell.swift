//
//  CommonProductTableCell.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 04/01/22.
//

import UIKit
//MARK: - Delegate Creation
protocol productCellselectDelegate {
    func addToCartCompletionWith(product: Products)
}
class CommonProductTableCell: UITableViewCell {
    //MARK: - IB Outlets
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    @IBOutlet weak var bttnViewAll: UIButton!
    
    @IBOutlet weak var lblTittle: UILabel!
    
    @IBOutlet weak var productBGView: UIView!
    
    //MARK: - Variables and Constants
    var clvIndexValue : Int = 0
    
    var productCategoryModel = [ProductCategory]()
    
    var completionDelegate : productCellselectDelegate!
    
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
        self.productCollectionView.register(UINib(nibName: "productCollectionCell", bundle: nil), forCellWithReuseIdentifier: "productCollectionCell")
        self.categoryCollectionView.reloadData()
        self.productCollectionView.reloadData()
    }
}
//MARK: - Collection View Delegate
extension CommonProductTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //MARK: - Cell Layouts
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.categoryCollectionView{
            let label = UILabel(frame: CGRect.zero)
            label.text = self.productCategoryModel[indexPath.row].name?.uppercased()
            label.sizeToFit()
            setNeedsLayout()
            let labelSize = label.frame.width
            return CGSize(width: labelSize, height: 40)
        }else{
            let collectionViewWidth = collectionView.bounds.width
            return CGSize(width: collectionViewWidth/2 - 5, height: 307)
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
            return self.productCategoryModel.count
        }else{
            return self.productCategoryModel[clvIndexValue].products?.count ?? 0
        }
       
    }
    //MARK: - Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.categoryCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "commonCategoryCollectionCell", for: indexPath) as! commonCategoryCollectionCell
                cell.categoryLabel.text = self.productCategoryModel[indexPath.row].name?.uppercased()
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCollectionCell", for: indexPath) as! productCollectionCell
                cell.productAddToCartButton.tag = indexPath.row
                cell.productAddToCartButton.addTarget(self, action: #selector(self.addToCartButtonTapped), for: .touchUpInside)
                cell.productsModel = self.productCategoryModel[clvIndexValue].products![indexPath.row]
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
//MARK: - Button Tap
extension CommonProductTableCell{
    //MARK: - Add To Cart Button Tap
    @objc func addToCartButtonTapped(sender : UIButton) {
        let selectedBtn = sender
        selectedBtn.isSelected = !selectedBtn.isSelected
        let buttonPostion = selectedBtn.convert(selectedBtn.bounds.origin, to: productCollectionView)
        if let indexPath = productCollectionView.indexPathForItem(at: buttonPostion) {
            let currentModel = self.productCategoryModel[clvIndexValue].products![indexPath.row]
            self.completionDelegate.addToCartCompletionWith(product: currentModel)
        }
    }
}
