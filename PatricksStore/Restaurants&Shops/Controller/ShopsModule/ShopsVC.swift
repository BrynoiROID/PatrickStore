//
//  ShopsVC.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 28/09/21.
//

import UIKit

class ShopsVC: UIViewController,UISearchBarDelegate {

    //MARK: - IB Outlets
    @IBOutlet weak var bttnBack: UIButton!
    
    @IBOutlet weak var bttnSearch: UIButton!
    
    @IBOutlet weak var bttnProfile: UIButton!
    
    @IBOutlet weak var bttnCall: UIButton!
    
    @IBOutlet weak var bttnCart: UIButton!
    
    @IBOutlet weak var clvCategroy: UICollectionView!
    
    @IBOutlet weak var viewSearch: UIView!
    
    @IBOutlet weak var searchBarSeller: UISearchBar!
    
    @IBOutlet weak var tblShops: UITableView!
    
    //MARK: - Variables and Constants
    var categoryTypeArray = ["Food & Beverages","Mobile & Laptop","All"]
    
    var clvIndexValue: Int = -1
    
    var passedClvIndexValue: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        
        // Set status bar color
        Helper.StatusBarColor(view: self.view)
        
        // Set Bottom Shadow
        Helper.shadowSetViewBottom(view: self.viewSearch)
        
        // Setup Collection View
        self.setupCollectionView(indexValue: passedClvIndexValue)
    }
    
    //MARK: - Setup Collection View Index Value
    func setupCollectionView(indexValue: Int) {
        if indexValue != -1 {
            self.clvIndexValue = indexValue
            self.clvCategroy.reloadData()
            self.clvCategroy.scrollToItem(at: IndexPath(item: clvIndexValue, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    //MARK: - Search Bar Handling
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if UIApplication.shared.isKeyboardPresented {
            self.view.endEditing(true)
        }
    }
    
    //MARK: - Back Button Action
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - Collection View Logic
extension ShopsVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let label:UILabel = UILabel()
        label.textColor=UIColor.white
        label.font = UIFont(name:"Barlow-Regular", size: 15.0)
        label.numberOfLines = 1
        label.text = self.categoryTypeArray[indexPath.row]
        label.sizeToFit()
        label.frame = CGRect(x: 5, y: 0, width: label.frame.width, height:label.frame.height)
        return CGSize(width: label.frame.width + 40, height: 35)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "clvCategoryCell", for: indexPath) as! clvCategoryCell
        cell.lblCategory.text = self.categoryTypeArray[indexPath.row]
        if indexPath.item == clvIndexValue {
            cell.imgSelected.alpha = 1
        } else {
            cell.imgSelected.alpha = 0
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.clvIndexValue = indexPath.row
        self.clvCategroy.reloadData()
        self.clvCategroy.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
}

//MARK: - Table View Logic
extension ShopsVC:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblShopsCell") as! tblShopsCell
            cell.selectionStyle = .none
            cell.awakeFromNib()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sty = UIStoryboard(name: "Shops", bundle: nil)
        let vc = sty.instantiateViewController(withIdentifier: "ShopDetailsVC") as! ShopDetailsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
