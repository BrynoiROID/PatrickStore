//
//  ProfileVC.swift
//  PatricksStore
//
//  Created by Admin on 03/09/21.
//

import UIKit

class ProfileVC: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet weak var profileView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Set status bar color
        Helper.StatusBarColor(view: self.view)
        
        // Profile View
        profileView.layer.cornerRadius = profileView.frame.height / 2.0
    }
    
    //MARK: - Button Actions
    
    // Back Button Action
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // Edit Profile Button Action
    @IBAction func editProfileButtonTapped(_ sender: UIButton) {
        Helper.showAlert(message: "Edit Profile Button Tapped")
    }
    
    // Become Seller Button Action
    @IBAction func becomeSellerButtonTapped(_ sender: UIButton) {
        Helper.showAlert(message: "Become Seller Button Tapped")
    }
    
}

//MARK: - Profile Table Logic
extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        switch index {
        
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
                cell.menuImage.image = UIImage(named: "orders")
                cell.menuLabel.text = "My Orders"
                cell.selectionStyle = .none
                return cell
                
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
                cell.menuImage.image = UIImage(named: "Reviews")
                cell.menuLabel.text = "My Reviews"
                cell.selectionStyle = .none
                return cell
                
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
                cell.menuImage.image = UIImage(named: "Address")
                cell.menuLabel.text = "My Addresses"
                cell.selectionStyle = .none
                return cell
                
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
                cell.menuImage.image = UIImage(named: "Wishlist")
                cell.menuLabel.text = "Wishlist"
                cell.selectionStyle = .none
                return cell
                
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
                cell.menuImage.image = UIImage(named: "Payments")
                cell.menuLabel.text = "Recurring payments"
                cell.selectionStyle = .none
                return cell
                
            case 5:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
                cell.menuImage.image = UIImage(named: "Wallet")
                cell.menuLabel.text = "Wallet"
                cell.selectionStyle = .none
                return cell
                
            case 6:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
                cell.menuImage.image = UIImage(named: "Notification Bell")
                cell.menuLabel.text = "Notification"
                cell.separatorView.isHidden = true
                cell.selectionStyle = .none
                return cell
                
            case 7:
                let cell = tableView.dequeueReusableCell(withIdentifier: "BlankTableViewCell") as! BlankTableViewCell
                cell.backgroundColor = Helper.colorFromHexString(hex: "#F7F8FB")
                cell.selectionStyle = .none
                return cell
                
            case 8:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
                cell.backgroundColor = Helper.colorFromHexString(hex: "#F7F8FB")
                cell.arrowImage.isHidden = true
                cell.separatorView.isHidden = true
                cell.menuImage.image = UIImage(named: "Password")
                cell.menuLabel.text = "Change Password"
                cell.selectionStyle = .none
                return cell
                
            case 9:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
                cell.backgroundColor = Helper.colorFromHexString(hex: "#F7F8FB")
                cell.arrowImage.isHidden = true
                cell.separatorView.isHidden = true
                cell.menuImage.image = UIImage(named: "Logout")
                cell.menuLabel.text = "Logout"
                cell.selectionStyle = .none
                return cell
                
            default:
                return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        let row = indexPath.row
        if section == 0 && row == 7 {
            return 20.0 // Sets height for BlankTableViewCell
        }
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index = indexPath.row
        switch index {
        
            case 0:
                let sty = UIStoryboard(name: "MyOrders", bundle: nil)
                let vc = sty.instantiateViewController(withIdentifier: "MyOrdersVC") as! MyOrdersVC
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case 1:
                break
                
            case 2:
                let sty = UIStoryboard(name: "MyAddresses", bundle: nil)
                let vc = sty.instantiateViewController(withIdentifier: "MyAddressesVC") as! MyAddressesVC
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case 3:
                let sty = UIStoryboard(name: "Wishlist", bundle: nil)
                let vc = sty.instantiateViewController(withIdentifier: "WishlistVC") as! WishlistVC
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case 4:
                break
                
            case 5:
                let sty = UIStoryboard(name: "WalletStoryBoard", bundle: nil)
                let vc = sty.instantiateViewController(withIdentifier: "WalletVC") as! WalletVC
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case 6:
                break
                
            case 7:
                break
                
            case 8:
                let sty = UIStoryboard(name: "ChangePassword", bundle: nil)
                let vc = sty.instantiateViewController(withIdentifier: "ChangePasswordVC") as! ChangePasswordVC
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case 9:
                let refreshAlert = UIAlertController(title: "Logout", message: "Do you really want to logout?", preferredStyle: UIAlertController.Style.alert)
                refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
                    let storyboard = UIStoryboard.init(name: "Login", bundle: nil)
                    let viewController = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                    let navigationController = UINavigationController(rootViewController: viewController)
                    navigationController.navigationBar.isHidden = true
                    navigationController.interactivePopGestureRecognizer?.delegate = viewController
                    UIApplication.shared.windows.first?.rootViewController = navigationController
                    UIApplication.shared.windows.first?.makeKeyAndVisible()
                }))
                
                refreshAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
                    print("Handle Cancel Logic here")
                }))
                present(refreshAlert, animated: true, completion: nil)
            default:
                break
                
        }
    }
    
    
}
