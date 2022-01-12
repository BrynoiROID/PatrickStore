//
//  AllCategoriesVC.swift
//  PatricksStore
//
//  Created by Admin on 08/09/21.
//

import UIKit

class AllCategoriesVC: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var btnFliter: UIButton!
    
    @IBOutlet weak var btnSort: UIButton!
    
    @IBOutlet weak var lblFilterTitle: UILabel!
    
    @IBOutlet weak var tblAllCategories: UITableView!
    
    @IBOutlet weak var colVwAllCategories: UICollectionView!
    
    //MARK: - Variables and Constants

    var productCategoryModel = [ProductCategoryData]()
    
    var currentCategoryModel : ProductCategoryData?
    
    var indexSelected = 0
    
    var viewModel = AllCategoriesViewModel()
    
    var productModel : ProductData?
    
    var selectedCategory : CategoryData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    //MARK: - Initial Setup
    func initialSetup() {
        // Set status bar color
        Helper.StatusBarColor(view: self.view)
        // Title Label
        self.lblTitle.font = UIFont(name: "Barlow-SemiBold", size: 20)
        self.lblTitle?.textColor = .white
        // Filter Title Label
        self.lblFilterTitle.font = UIFont(name: "Barlow-Regular", size: 16)
        self.lblFilterTitle?.textColor = Helper.colorFromHexString(hex: "#262626")
        self.colVwAllCategories.register(UINib(nibName: "productCollectionCell", bundle: nil), forCellWithReuseIdentifier: "productCollectionCell")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        // Reload Table after row is selected
        self.currentCategoryModel = self.productCategoryModel[indexSelected]
        self.selectedCategoryData()
    }
    //MARK: - Button Actions
    // Back Button Action
    @IBAction func btnAcnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    // Filter Button Action
    @IBAction func btnAcnFilter(_ sender: UIButton) {
        // Code here
    }
    // Sort Button Action
    @IBAction func btnACnSort(_ sender: UIButton) {
        // Code here
    }
}

//MARK: - Categories Table View Logic
extension AllCategoriesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productCategoryModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideCategoryCell") as! SideCategoryCell
        let currentModel = self.productCategoryModel[indexPath.row]
            cell.lblItemName.text = currentModel.name
        if indexPath.row == indexSelected {
            cell.vwBackground.backgroundColor = Helper.colorFromHexString(hex: "#F7F8FB")
        } else {
            cell.vwBackground.backgroundColor = .white
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.indexSelected = indexPath.row
        self.tblAllCategories.reloadData()
        self.tblAllCategories.scrollToRow(at: IndexPath(row: indexPath.row, section: 0), at: .middle, animated: true)
        self.currentCategoryModel = self.productCategoryModel[indexPath.row]
        self.selectedCategoryData()
    }
    //MARK: - Setting Data to Model
    func selectedCategoryData(){
        self.selectedCategory = CategoryData(limit: "10", categoryId: self.currentCategoryModel!._id, isPerishable: String(self.currentCategoryModel!.isPerishable!))
        //Api Calling
        self.checkConnectivityProductData()
    }
}
//MARK: - Category Items Collection View Logic
extension AllCategoriesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.productModel?.items?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCollectionCell", for: indexPath) as! productCollectionCell
        cell.productsModel = self.productModel!.items![indexPath.row]
        cell.awakeFromNib()
        return cell
//        if indexSelected % 2 == 0 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colVwCelAllCategory", for: indexPath) as! colVwCelAllCategory
//            cell.setupUI()
//            cell.ratingView.rating = 3.5
//            return cell
//        } else {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colvwNonPerishableCell", for: indexPath) as! colvwNonPerishableCell
//            return cell
//        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let sizeWidth = CGFloat(collectionView.bounds.width/2) - 5
//        let sizeHeight = (indexSelected % 2 == 0 ? CGFloat(290.0) : CGFloat(250.0))
//        return CGSize(width: sizeWidth, height: sizeHeight)
        let collectionViewWidth = collectionView.bounds.width
        return CGSize(width: collectionViewWidth/2 - 5, height: 307)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        // To give space top left bottom and right for cells
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let strybd = UIStoryboard(name: "Item", bundle: nil)
        let vc = strybd.instantiateViewController(withIdentifier: "ItemDetail") as! ItemDetail
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
//MARK: - API Call
extension AllCategoriesVC {
    //MARK: - Product List API
    func checkConnectivityProductData() {
        if Helper.checkInternetConnectivity() {
            viewModel.ProductDataFetchAPI(catModel: self.selectedCategory!,completion: { [self](result) in
                self.productModel = result
                DispatchQueue.main.async {
                    self.colVwAllCategories.reloadData()
                }
            })
        } else {
            Helper.showAlert(message: "Please check your Internet connection")
        }
    }
}
