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
    
    var categoryArray: [String] = ["Food & Beverages", "Mobile & Laptop", "Bags and Shoes", "Electronics", "Fashion Accessories", "Grocery", "Health and Beauty", "Home Appliances", "Kids Clothing", "Books & Stationary", "Mens Clothing", "Womens Clothing"]
    
    var indexSelected = 0
    
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        // Reload Table after row is selected
        self.tableRowSelected()
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
    
    // Add to Cart Button Action
    @IBAction func btnAcnAdd2Cart(_ sender: UIButton) {
        
        let btnIndex = sender.convert(sender.bounds.origin, to: self.colVwAllCategories)
        
        if let indexPath = self.colVwAllCategories.indexPathForItem(at: btnIndex) {
            print("Button Clicked at \(indexPath.item) Index")
        }
    }
}

//MARK: - Categories Table View Logic
extension AllCategoriesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideCategoryCell") as! SideCategoryCell
        cell.lblItemName.text = categoryArray[indexPath.row]
        if indexPath.row == indexSelected {
            cell.vwBackground.backgroundColor = Helper.colorFromHexString(hex: "#F7F8FB")
        } else {
            cell.vwBackground.backgroundColor = .white
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSelected = indexPath.row
        print("Button Clicked at \(indexPath.row) Index")
        tableRowSelected()
    }
    
    func tableRowSelected() {
        tblAllCategories.reloadData()
        tblAllCategories.scrollToRow(at: IndexPath(row: indexSelected, section: 0), at: .middle, animated: true)
        colVwAllCategories.reloadData()
    }
    
}

//MARK: - Category Items Collection View Logic
extension AllCategoriesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexSelected % 2 == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colVwCelAllCategory", for: indexPath) as! colVwCelAllCategory
            cell.setupUI()
            cell.ratingView.rating = 3.5
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colvwNonPerishableCell", for: indexPath) as! colvwNonPerishableCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizeWidth = CGFloat(collectionView.bounds.width/2) - 15
        let sizeHeight = (indexSelected % 2 == 0 ? CGFloat(290.0) : CGFloat(250.0))
        return CGSize(width: sizeWidth, height: sizeHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        // To give space top left bottom and right for cells
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let strybd = UIStoryboard(name: "Item", bundle: nil)
        let vc = strybd.instantiateViewController(withIdentifier: "ItemDetail") as! ItemDetail
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
