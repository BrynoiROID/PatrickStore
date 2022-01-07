//
//  MyAddressesVC.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 23/09/21.
//

import UIKit

class MyAddressesVC: UIViewController,currentButtonTapDelegate {

    //MARK: - IB Outlets
    @IBOutlet weak var bttnBack: UIButton!
    
    @IBOutlet weak var bttnAddNewAddress: UIButton!
    
    @IBOutlet weak var tblMyAddresses: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    // MARK: - Initial Setup
    func initialSetup() {
        
        // Set status bar color
        Helper.StatusBarColor(view: self.view)
        
        // Table Separator Setting
        self.tblMyAddresses.separatorStyle = .none
    }
    
    //MARK: - Button Actions
    
    // Back Button Action
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // Add New Address Button Action
    @IBAction func addNewAddressButtonTapped(_ sender: UIButton) {
        let sty = UIStoryboard(name: "MyAddresses", bundle: nil)
        let vc = sty.instantiateViewController(withIdentifier: "AddAddressVC") as! AddAddressVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - Tableview Cell Button Delegates
    
    // Tableview Edit Button Delegate
    func editButtonSelection(indexValue: Int) {
        print("Edit Button Tapped on Index Value", indexValue)
    }
    
    // Tableview Delete Button Delegate
    func deleteButtonSelection(indexValue: Int) {
        print("Delete Button Tapped on Index Value", indexValue)
    }
}

// MARK: - Tableview Logic
extension MyAddressesVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 196
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblMyAddressesCell", for: indexPath) as! tblMyAddressesCell
        cell.selectionStyle = .none
        cell.bttnDelete.tag = indexPath.row
        cell.bttnEdit.tag = indexPath.row
        cell.buttonSelectionDelegate = self
        cell.awakeFromNib()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
