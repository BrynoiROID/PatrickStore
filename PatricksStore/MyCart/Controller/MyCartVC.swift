//
//  MyCartVC.swift
//  PatricksStore
//
//  Created by Admin on 08/09/21.
//

import UIKit

class MyCartVC: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet weak var tblMyCart: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Set status bar color
        Helper.StatusBarColor(view: self.view)
    }
    
    //MARK: - Button Taps
    
    // Back Button Action
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // Change Location Button Action
    @IBAction func changeLocationButtonTapped(_ sender: UIButton){
        
        let btnIndex = sender.convert(sender.bounds.origin, to: self.tblMyCart)
        
        if let indexPath = self.tblMyCart.indexPathForRow(at: btnIndex) {
            print("Change Location Button Tapped at \(indexPath.row)")
        }
    }
    
    // Get Current Location Button Action
    @IBAction func getCurrentLocationButtonTapped(_ sender: UIButton) {
        
        let btnIndex = sender.convert(sender.bounds.origin, to: self.tblMyCart)
        
        if let indexPath  = self.tblMyCart.indexPathForRow(at: btnIndex) {
            print("Current Location Button Tapped at \(indexPath.row)")
        }
    }
    
    // Continue Shopping Button Action
    @IBAction func btnContinueShopping(_ sender: UIButton) {
        Helper.showAlert(message: "Continue Shopping Button Tapped")
    }
    
    // Checkout Button Action
    @IBAction func btnCheckout(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "MyCart", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "OrderSummaryVC") as! OrderSummaryVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

//MARK: - Table View Logic
extension MyCartVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        switch index {
        
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell") as! AddressTableViewCell
                cell.lblAddress.text = "Iroid technologies, 2nd floor, Trust Building, Kayyath Line , Palarivattom, Kayyath Line"
                cell.lblPlace.text = "Ernakulam"
                cell.lblMobileNumber.text = "8089156379"
                return cell
                
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "StoreTableViewCell") as! StoreTableViewCell
                cell.imgStore.image = UIImage(named: "store-image")
                cell.lblStoreName.text = "7 Days Mini Super Market"
                cell.lblStoreDistance.text = "5km"
                cell.lblETA.text = "26 August 2020"
                return cell
            
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "StoreTableViewCell") as! StoreTableViewCell
                cell.imgStore.image = UIImage(named: "myg-store-image")
                cell.lblStoreName.text = "MyG Store Alappuzha"
                cell.lblStoreDistance.text = "5km"
                cell.lblETA.text = "27 August 2020"
                return cell
            
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "PriceDetailsTableViewCell") as! PriceDetailsTableViewCell
                cell.lblSubTotal.text = "₹250.00"
                cell.lblTax.text = "₹123.00"
                cell.lblDeliveryCharge.text = "₹100.00"
                cell.lblTotal.text = "₹2,780.00"
                return cell
            
            default:
                return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let index = indexPath.row
        
        switch index {
            case 0:
                return 250.0
            
            case 1:
                return 475.0
            
            case 2:
                return 475.0
            
            case 3:
                return 216.0
            
            default:
                return 0
        }
    }
    
    
}
