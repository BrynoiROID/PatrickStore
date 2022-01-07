//
//  OrderDetailsVC.swift
//  PatricksStore
//
//  Created by Admin on 23/09/21.
//

import UIKit

class OrderDetailsVC: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet weak var tblOrderDetails: UITableView!
    
    @IBOutlet weak var lblOrderDate: UILabel!
    
    @IBOutlet weak var vwOrderDateContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    // MARK: - Initial Setup
    func initialSetup() {
        
        // Set status bar color
        Helper.StatusBarColor(view: self.view)
        
        // Set bottom shadow for view
        Helper.shadowSetViewBottom(view: vwOrderDateContainer)
        
        // Order date label
        self.lblOrderDate.text = "20 / 05 / 2019"
    }
    
    //MARK: - Button Actions
    
    //Back Button Action
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popToViewController(ofClass: ConfirmOrderVC.self)
    }
    
}

//MARK: - Order Details Table Logic
extension OrderDetailsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        switch index {
        
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailsTVCell") as! OrderDetailsTVCell
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailsTVCell") as! OrderDetailsTVCell
            return cell
        
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailsTimelineTVCell") as! OrderDetailsTimelineTVCell
            return cell
        
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailsMapTVCell") as! OrderDetailsMapTVCell
            return cell
        
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailsShippingAddressTVCell") as! OrderDetailsShippingAddressTVCell
            cell.lblName.text = "Samuel Joseph"
            cell.btnAddressType.setTitle("WORK", for: .normal)
            cell.lblAddress.text = "Iroid technologies, 2nd floor, Trust Building, Kayyath Line , Palarivattom, Kayyath Line, Ernakulam, Kerala - 682025"
            cell.lblContactNumber.text = "+91 845 124 658 1"
            return cell
        
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailsPriceDetailsTVCell") as! OrderDetailsPriceDetailsTVCell
            cell.lblSubTotal.text = "₹325"
            cell.lblAddCharge.text = "₹325"
            cell.lblServiceCharge.text = "₹325"
            cell.lblPaymentMethod.text = "Cash On Delivery"
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let index = indexPath.row
        
        switch index {
            case 0:
                return 415.0
                
            case 1:
                return 415.0
                
            case 2:
                return 336.0
            
            case 3:
                return 347.0
            
            case 4:
                return 234.0
                
            case 5:
                return 238.0
                
            default:
                return 0
        }
        
    }
    
}
