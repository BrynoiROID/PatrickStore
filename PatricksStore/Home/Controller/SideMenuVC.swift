//
//  SideMenuVC.swift
//  PatricksStore
//
//  Created by Admin on 03/09/21.
//

import UIKit

class SideMenuVC: UIViewController {

    var serviceCategoryModel = [ServiceCategoryData]()
    
    var productCategoryModel = [ProductCategoryData]()
    
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
        return self.serviceCategoryModel.count +  self.productCategoryModel.count + 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 || indexPath.row == self.serviceCategoryModel.count + 3{
            // SideMenuCategoryTableViewCell
            return 60.0
        }else if indexPath.row == self.serviceCategoryModel.count + 2{
            // SideMenuSeparatorTableViewCell
            return 20.0
        }else{
            // SideMenuCategoryItemTableViewCell
            return 40.0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 || indexPath.row == self.serviceCategoryModel.count + 3{
            // SideMenuCategoryTableViewCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCategoryTableViewCell") as! SideMenuCategoryTableViewCell
            cell.selectionStyle = .none
            if indexPath.row == 0 {
                cell.lblCategoryName.text = "Services"
            }else{
                cell.lblCategoryName.text = "Products"
            }
            return cell
        }else if indexPath.row == self.serviceCategoryModel.count + 1 || indexPath.row == self.serviceCategoryModel.count + self.productCategoryModel.count + 4{
            // SideMenuViewAllTableViewCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuViewAllCategoryTableViewCell") as! SideMenuViewAllCategoryTableViewCell
            cell.selectionStyle = .none
            return cell
        }else if indexPath.row == self.serviceCategoryModel.count + 2{
            // SideMenuSeparatorTableViewCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuSeparatorTableViewCell") as! SideMenuSeparatorTableViewCell
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCategoryItemTableViewCell") as! SideMenuCategoryItemTableViewCell
            cell.selectionStyle = .none
            if indexPath.row > self.serviceCategoryModel.count + 3{
                let value = self.serviceCategoryModel.count + 4
                let currentModel = self.productCategoryModel[indexPath.row - value]
                cell.lblCategoryItem.text = currentModel.name
            }else{
                let currentModel = self.serviceCategoryModel[indexPath.row - 1]
                cell.lblCategoryItem.text = currentModel.name
            }
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
