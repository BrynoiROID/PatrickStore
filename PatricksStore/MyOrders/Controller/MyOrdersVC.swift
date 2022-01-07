//
//  MyOrdersVC.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 27/09/21.
//

import UIKit

class MyOrdersVC: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet weak var bttnBack: UIButton!
    
    @IBOutlet weak var tblMyOrders: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        
        // Setup status bar color
        Helper.StatusBarColor(view: self.view)
        
        // Table Separator Setting
        self.tblMyOrders.separatorStyle = .none
    }
    
    //MARK: - Button Actions
    
    // Back Button Action
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Tableview Logic
extension MyOrdersVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 194
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblMyOrderCell", for: indexPath) as! tblMyOrderCell
        cell.selectionStyle = .none
        cell.awakeFromNib()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
