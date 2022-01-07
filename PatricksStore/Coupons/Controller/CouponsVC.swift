//
//  CouponsVC.swift
//  PatricksStore
//
//  Created by Admin on 29/09/21.
//

import UIKit

class CouponsVC: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet weak var tblCoupon: UITableView!
    
    //MARK: - Variables and Constants
    let colorArray = [Helper.colorFromHexString(hex: "#534FBC"), Helper.colorFromHexString(hex: "#135851"), Helper.colorFromHexString(hex: "#1B8278")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        Helper.StatusBarColor(view: self.view)
    }
    
    //MARK: - Button Taps
    
    //Back Button Action
    @IBAction func btnBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //Redeem Coupon Button Action
    @IBAction func btnRedeemCouponTapped(_ sender: UIButton) {
        let btnIndex = sender.convert(sender.bounds.origin, to: self.tblCoupon)
        
        if let indexPath = self.tblCoupon.indexPathForRow(at: btnIndex) {
            print("Redeem Coupon Button Tapped at \(indexPath.row)")
        }
    }

}

//MARK: - Coupon TableView Logic
extension CouponsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CouponTVCell") as! CouponTVCell
        cell.vwLeftCoupon.backgroundColor = colorArray[indexPath.row]
        cell.lblDescription.text = "Adidas gift value packed 50% OFF for every pack"
        cell.lblExpiryDate.text = "30 Jul 2021"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160.0
    }
    
}
