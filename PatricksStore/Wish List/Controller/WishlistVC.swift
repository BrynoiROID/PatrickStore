//
//  WishlistVC.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 27/09/21.
//

import UIKit

class WishlistVC: UIViewController, currentWishlistButtonTapDelegate {

    //MARK: - IB Outlets
    @IBOutlet weak var bttnBack: UIButton!
    
    @IBOutlet weak var bttnUserProfile: UIButton!
    
    @IBOutlet weak var bttnCart: UIButton!
    
    @IBOutlet weak var tblWishList: UITableView!
    
    @IBOutlet weak var bttnClearAll: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        
        // Set status bar color
        Helper.StatusBarColor(view: self.view)
        
        // Table Separator Setting
        self.tblWishList.separatorStyle = .none
    }
    
    // MARK: - Button Actions
    
    // Back Button Action
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // Cart Button Action
    @IBAction func cartButtonTapped(_ sender: UIButton) {
    }
    
    // Profile Button Action
    @IBAction func profileButtonTapped(_ sender: UIButton) {
    }
    
    // Clear All Button Action
    @IBAction func clearAllButtonTapped(_ sender: UIButton) {
    }
    
    // MARK: - TableView Cell Button Delegates
    
    // Tableview removeCart Button Delegate
    func removeCartButtonSelection() {
    }
    
    // Tableview addCart Button Delegate
    func addCartButtonSelection() {
    }
}

//MARK: - TableView Delegate
extension WishlistVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 207
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblWishListCell", for: indexPath) as! tblWishListCell
        cell.selectionStyle = .none
        cell.bttnRemoveCart.tag = indexPath.row
        cell.bttnAddCart.tag = indexPath.row
        cell.buttonSelectionDelegate = self
        cell.awakeFromNib()
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
