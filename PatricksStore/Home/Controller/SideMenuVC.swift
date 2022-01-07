//
//  SideMenuVC.swift
//  PatricksStore
//
//  Created by Admin on 03/09/21.
//

import UIKit

class SideMenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Set status bar color
        Helper.StatusBarColor(view: self.view)
    }

    //MARK: - Button Actions
    
    // Close Button Action
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

//MARK: - Side Menu Table View Logic
extension SideMenuVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 23
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // SideMenuCategoryTableViewCell
        if indexPath.row == 0 || indexPath.row == 8 {
            return 60.0
        
        // SideMenuSeparatorTableViewCell
        } else if indexPath.row == 7 || indexPath.row == 22 {
            return 20.0
        
        // SideMenuCategoryItemTableViewCell
        } else {
            return 40.0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // SideMenuCategoryTableViewCell
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCategoryTableViewCell") as! SideMenuCategoryTableViewCell
            cell.selectionStyle = .none
            cell.lblCategoryName.text = "Services"
            return cell
        
        // SideMenuCategoryItemTableViewCell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCategoryItemTableViewCell") as! SideMenuCategoryItemTableViewCell
            cell.selectionStyle = .none
            cell.lblCategoryItem.text = "Food & Beverages"
            return cell
            
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCategoryItemTableViewCell") as! SideMenuCategoryItemTableViewCell
            cell.selectionStyle = .none
            cell.lblCategoryItem.text = "Food & Beverages"
            return cell
            
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCategoryItemTableViewCell") as! SideMenuCategoryItemTableViewCell
            cell.selectionStyle = .none
            cell.lblCategoryItem.text = "Food & Beverages"
            return cell
            
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCategoryItemTableViewCell") as! SideMenuCategoryItemTableViewCell
            cell.selectionStyle = .none
            cell.lblCategoryItem.text = "Food & Beverages"
            return cell
            
        } else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCategoryItemTableViewCell") as! SideMenuCategoryItemTableViewCell
            cell.selectionStyle = .none
            cell.lblCategoryItem.text = "Food & Beverages"
            return cell
            
        } else if indexPath.row == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuViewAllCategoryTableViewCell") as! SideMenuViewAllCategoryTableViewCell
            cell.selectionStyle = .none
            return cell
        
        // SideMenuSeparatorTableViewCell
        } else if indexPath.row == 7 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuSeparatorTableViewCell") as! SideMenuSeparatorTableViewCell
            cell.selectionStyle = .none
            return cell
        
        // SideMenuCategoryTableViewCell
        } else if indexPath.row == 8 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCategoryTableViewCell") as! SideMenuCategoryTableViewCell
            cell.selectionStyle = .none
            cell.lblCategoryName.text = "Products"
            return cell
        
        // SideMenuCategoryItemTableViewCell
        } else if indexPath.row == 9 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCategoryItemTableViewCell") as! SideMenuCategoryItemTableViewCell
            cell.selectionStyle = .none
            cell.lblCategoryItem.text = "Food & Beverages"
            return cell
            
        } else if indexPath.row == 10 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCategoryItemTableViewCell") as! SideMenuCategoryItemTableViewCell
            cell.selectionStyle = .none
            cell.lblCategoryItem.text = "Mobile & Laptop"
            return cell
            
        } else if indexPath.row == 11 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCategoryItemTableViewCell") as! SideMenuCategoryItemTableViewCell
            cell.selectionStyle = .none
            cell.lblCategoryItem.text = "Bags and Shoes"
            return cell
            
        } else if indexPath.row == 12 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCategoryItemTableViewCell") as! SideMenuCategoryItemTableViewCell
            cell.selectionStyle = .none
            cell.lblCategoryItem.text = "Electronics"
            return cell
            
        } else if indexPath.row == 13 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCategoryItemTableViewCell") as! SideMenuCategoryItemTableViewCell
            cell.selectionStyle = .none
            cell.lblCategoryItem.text = "Fashion Accessories"
            return cell
            
        } else if indexPath.row == 14 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCategoryItemTableViewCell") as! SideMenuCategoryItemTableViewCell
            cell.selectionStyle = .none
            cell.lblCategoryItem.text = "Grocery"
            return cell
            
        } else if indexPath.row == 15 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCategoryItemTableViewCell") as! SideMenuCategoryItemTableViewCell
            cell.selectionStyle = .none
            cell.lblCategoryItem.text = "Health and Beauty"
            return cell
            
        } else if indexPath.row == 16 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCategoryItemTableViewCell") as! SideMenuCategoryItemTableViewCell
            cell.selectionStyle = .none
            cell.lblCategoryItem.text = "Home Appliances"
            return cell
            
        } else if indexPath.row == 17 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCategoryItemTableViewCell") as! SideMenuCategoryItemTableViewCell
            cell.selectionStyle = .none
            cell.lblCategoryItem.text = "Kids Clothing"
            return cell
            
        } else if indexPath.row == 18 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCategoryItemTableViewCell") as! SideMenuCategoryItemTableViewCell
            cell.selectionStyle = .none
            cell.lblCategoryItem.text = "Books & Stationary"
            return cell
            
        } else if indexPath.row == 19 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCategoryItemTableViewCell") as! SideMenuCategoryItemTableViewCell
            cell.selectionStyle = .none
            cell.lblCategoryItem.text = "Mens Clothing"
            return cell
            
        } else if indexPath.row == 20 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCategoryItemTableViewCell") as! SideMenuCategoryItemTableViewCell
            cell.selectionStyle = .none
            cell.lblCategoryItem.text = "Womens Clothing"
            return cell
            
        } else if indexPath.row == 21 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuViewAllCategoryTableViewCell") as! SideMenuViewAllCategoryTableViewCell
            cell.selectionStyle = .none
            return cell
        
        // SideMenuSeparatorTableViewCell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuSeparatorTableViewCell") as! SideMenuSeparatorTableViewCell
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let route = indexPath.item
        
        switch route {
            
            case 0:
                break
            
            case 1:
                let strybd = UIStoryboard(name: "Shops", bundle: nil)
                let vc = strybd.instantiateViewController(withIdentifier: "ShopsVC") as! ShopsVC
                vc.passedClvIndexValue = 0
                self.navigationController?.pushViewController(vc, animated: true)
            
            case 2:
                let strybd = UIStoryboard(name: "Shops", bundle: nil)
                let vc = strybd.instantiateViewController(withIdentifier: "ShopsVC") as! ShopsVC
                vc.passedClvIndexValue = 0
                self.navigationController?.pushViewController(vc, animated: true)
                
            case 3:
                let strybd = UIStoryboard(name: "Shops", bundle: nil)
                let vc = strybd.instantiateViewController(withIdentifier: "ShopsVC") as! ShopsVC
                vc.passedClvIndexValue = 0
                self.navigationController?.pushViewController(vc, animated: true)
                
            case 4:
                let strybd = UIStoryboard(name: "Shops", bundle: nil)
                let vc = strybd.instantiateViewController(withIdentifier: "ShopsVC") as! ShopsVC
                vc.passedClvIndexValue = 0
                self.navigationController?.pushViewController(vc, animated: true)
                
            case 5:
                let strybd = UIStoryboard(name: "Shops", bundle: nil)
                let vc = strybd.instantiateViewController(withIdentifier: "ShopsVC") as! ShopsVC
                vc.passedClvIndexValue = 0
                self.navigationController?.pushViewController(vc, animated: true)
                
            case 6:
                let strybd = UIStoryboard(name: "Shops", bundle: nil)
                let vc = strybd.instantiateViewController(withIdentifier: "ShopsVC") as! ShopsVC
                vc.passedClvIndexValue = 2
                self.navigationController?.pushViewController(vc, animated: true)
                
            case 7:
                break
                
            case 8:
                break
                
            case 9:
                let strybd = UIStoryboard(name: "HomeCategories", bundle: nil)
                let vc = strybd.instantiateViewController(withIdentifier: "AllCategoriesVC") as! AllCategoriesVC
                vc.indexSelected = 0
                self.navigationController?.pushViewController(vc, animated: true)
                
            case 10:
                let strybd = UIStoryboard(name: "HomeCategories", bundle: nil)
                let vc = strybd.instantiateViewController(withIdentifier: "AllCategoriesVC") as! AllCategoriesVC
                vc.indexSelected = 1
                self.navigationController?.pushViewController(vc, animated: true)
                
            case 11:
                let strybd = UIStoryboard(name: "HomeCategories", bundle: nil)
                let vc = strybd.instantiateViewController(withIdentifier: "AllCategoriesVC") as! AllCategoriesVC
                vc.indexSelected = 2
                self.navigationController?.pushViewController(vc, animated: true)
                
            case 12:
                let strybd = UIStoryboard(name: "HomeCategories", bundle: nil)
                let vc = strybd.instantiateViewController(withIdentifier: "AllCategoriesVC") as! AllCategoriesVC
                vc.indexSelected = 3
                self.navigationController?.pushViewController(vc, animated: true)
                
            case 13:
                let strybd = UIStoryboard(name: "HomeCategories", bundle: nil)
                let vc = strybd.instantiateViewController(withIdentifier: "AllCategoriesVC") as! AllCategoriesVC
                vc.indexSelected = 4
                self.navigationController?.pushViewController(vc, animated: true)
                
            case 14:
                let strybd = UIStoryboard(name: "HomeCategories", bundle: nil)
                let vc = strybd.instantiateViewController(withIdentifier: "AllCategoriesVC") as! AllCategoriesVC
                vc.indexSelected = 5
                self.navigationController?.pushViewController(vc, animated: true)
                
            case 15:
                let strybd = UIStoryboard(name: "HomeCategories", bundle: nil)
                let vc = strybd.instantiateViewController(withIdentifier: "AllCategoriesVC") as! AllCategoriesVC
                vc.indexSelected = 6
                self.navigationController?.pushViewController(vc, animated: true)
                
            case 16:
                let strybd = UIStoryboard(name: "HomeCategories", bundle: nil)
                let vc = strybd.instantiateViewController(withIdentifier: "AllCategoriesVC") as! AllCategoriesVC
                vc.indexSelected = 7
                self.navigationController?.pushViewController(vc, animated: true)
                
            case 17:
                let strybd = UIStoryboard(name: "HomeCategories", bundle: nil)
                let vc = strybd.instantiateViewController(withIdentifier: "AllCategoriesVC") as! AllCategoriesVC
                vc.indexSelected = 8
                self.navigationController?.pushViewController(vc, animated: true)
                
            case 18:
                let strybd = UIStoryboard(name: "HomeCategories", bundle: nil)
                let vc = strybd.instantiateViewController(withIdentifier: "AllCategoriesVC") as! AllCategoriesVC
                vc.indexSelected = 9
                self.navigationController?.pushViewController(vc, animated: true)
                
            case 19:
                let strybd = UIStoryboard(name: "HomeCategories", bundle: nil)
                let vc = strybd.instantiateViewController(withIdentifier: "AllCategoriesVC") as! AllCategoriesVC
                vc.indexSelected = 10
                self.navigationController?.pushViewController(vc, animated: true)
                
            case 20:
                let strybd = UIStoryboard(name: "HomeCategories", bundle: nil)
                let vc = strybd.instantiateViewController(withIdentifier: "AllCategoriesVC") as! AllCategoriesVC
                vc.indexSelected = 11
                self.navigationController?.pushViewController(vc, animated: true)
                
            case 21:
                let strybd = UIStoryboard(name: "HomeCategories", bundle: nil)
                let vc = strybd.instantiateViewController(withIdentifier: "AllCategoriesVC") as! AllCategoriesVC
                self.navigationController?.pushViewController(vc, animated: true)
            
            default:
                break
        }
    }

}
