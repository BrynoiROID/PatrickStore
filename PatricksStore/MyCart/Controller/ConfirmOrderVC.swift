//
//  ConfirmOrderVC.swift
//  PatricksStore
//
//  Created by Admin on 22/09/21.
//

import UIKit

class ConfirmOrderVC: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet weak var tblConfirmOrder: UITableView!
    
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
    
    // Back Button Action
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // View Details Button Action
    @IBAction func viewDetailsButtonTapped(_ sender: UIButton) {
    }
    
    // Confirm Order Button Action
    @IBAction func confirmOrderButtonTapped(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "MyCart", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "PaymentCompleteVC") as! PaymentCompleteVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

//MARK: - Order Summary Table Logic
extension ConfirmOrderVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        
        switch index {
        
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ShippingAddressTableViewCell") as! ShippingAddressTableViewCell
                return cell
            
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmOrderItemTitleTVCell") as! ConfirmOrderItemTitleTVCell
                return cell
            
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmOrderItemsTVCell") as! ConfirmOrderItemsTVCell
                return cell
            
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmOrderPriceDetailsTVCell") as! ConfirmOrderPriceDetailsTVCell
                return cell
            
            default:
                return UITableViewCell()
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let index = indexPath.row
        
        switch index {
        
            case 0:
                return 155.0
            
            case 1:
                return 40.0
            
            case 2:
                return 632.0
                
            case 3:
                return 220.0
            
            default:
                return 0
        }
    }
}
