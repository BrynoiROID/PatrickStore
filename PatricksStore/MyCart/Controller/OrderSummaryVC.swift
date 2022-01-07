//
//  OrderSummaryVC.swift
//  PatricksStore
//
//  Created by Admin on 16/09/21.
//

import UIKit

class OrderSummaryVC: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet weak var tblOrderSummary: UITableView!
    
    //MARK: - Variables and Constants
    var checkboxCODFlag = false
    
    var checkboxOnlineFlag = false
    
    enum paymentMethod {
        case cod
        case online
        case none
    }
    
    var selectedPaymentMethod = paymentMethod.none
        
    var radioButtonFlag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        Helper.StatusBarColor(view: self.view)
    }
    
    //MARK: - Button Actions
    
    // Back Button Action
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // COD Checkbox Button Action
    @IBAction func btnCODCheckboxTapped(_ sender: UIButton) {

        let btnIndex = sender.convert(sender.bounds.origin, to:self.tblOrderSummary)

        if let indexPath = self.tblOrderSummary.indexPathForRow(at: btnIndex) {

            guard let cell = tblOrderSummary.cellForRow(at: indexPath) as? PaymentMethodTableViewCell else { return }
            
            if selectedPaymentMethod != .cod {
                cell.btnCODCheckbox.setTitle("✓", for: .normal)
                cell.btnOPCheckbox.setTitle("", for: .normal)
                selectedPaymentMethod = .cod
            }
        }

    }
    
    // Online Payment Checkbox Button Action
    @IBAction func btnOPCheckboxTapped(_ sender: UIButton) {
        let btnIndex = sender.convert(sender.bounds.origin, to:self.tblOrderSummary)

        if let indexPath = self.tblOrderSummary.indexPathForRow(at: btnIndex) {

            guard let cell = tblOrderSummary.cellForRow(at: indexPath) as? PaymentMethodTableViewCell else { return }
            
            if selectedPaymentMethod != .online {
                cell.btnOPCheckbox.setTitle("✓", for: .normal)
                cell.btnCODCheckbox.setTitle("", for: .normal)
                selectedPaymentMethod = .online
            }
        }

    }
        
    // Select Coupon Button Action
    @IBAction func selectCouponButtonTapped(_ sender: UIButton) {
        let btnIndex = sender.convert(sender.bounds.origin, to:self.tblOrderSummary)
        
        if let indexPath = self.tblOrderSummary.indexPathForRow(at: btnIndex) {
            print("Apply Coupon Button Tapped at \(indexPath.row)")
            let storyBoard = UIStoryboard(name: "Coupons", bundle: nil)
            let controller = storyBoard.instantiateViewController(withIdentifier: "CouponsVC") as! CouponsVC
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    // Apply Coupon Button Action
    @IBAction func applyCouponButtonTapped(_ sender: UIButton) {
        let btnIndex = sender.convert(sender.bounds.origin, to:self.tblOrderSummary)
        
        if let indexPath = self.tblOrderSummary.indexPathForRow(at: btnIndex) {
            print("Apply Coupon Button Tapped at \(indexPath.row)")
        }
    }
    
    // Apply Referral Code Button Action
    @IBAction func applyReferralCodeButtonTapped(_ sender: UIButton) {
        let btnIndex = sender.convert(sender.bounds.origin, to:self.tblOrderSummary)
        
        if let indexPath = self.tblOrderSummary.indexPathForRow(at: btnIndex) {
            print("Apply Referral Code Button Tapped at \(indexPath.row)")
        }
        
    }
    
    // Apply Gift Certificate Button Action
    @IBAction func applyGiftCertificateButtonTapped(_ sender: UIButton) {
        let btnIndex = sender.convert(sender.bounds.origin, to:self.tblOrderSummary)
        
        if let indexPath = self.tblOrderSummary.indexPathForRow(at: btnIndex) {
            print("Apply Gift Certificate Button Tapped at \(indexPath.row)")
        }
        
    }
    
    // Wallet Info Button Action
    @IBAction func walletInfoButtonTapped(_ sender: UIButton) {
        let btnIndex = sender.convert(sender.bounds.origin, to:self.tblOrderSummary)
        
        if let indexPath = self.tblOrderSummary.indexPathForRow(at: btnIndex) {
            print("Wallet Info Button Tapped at \(indexPath.row)")
        }
        
    }
    
    // Select Wallet Cash Radio Button Action
    @IBAction func selectWalletCashButtonTapped(_ sender: UIButton) {
        
        let btnIndex = sender.convert(sender.bounds.origin, to:self.tblOrderSummary)
        
        if let indexPath = self.tblOrderSummary.indexPathForRow(at: btnIndex) {
            
            guard let cell = tblOrderSummary.cellForRow(at: indexPath) as? PatricksStoreWalletTableViewCell else { return }
            
            if radioButtonFlag == false {
                cell.imgRadioButton.image = UIImage(named: "Ellipse-Icon-Filled")
                radioButtonFlag = true
            } else {
                cell.imgRadioButton.image = UIImage(named: "Ellipse-Icon")
                radioButtonFlag = false
            }
        }
        
    }
    
    // Continue Button Action
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        let btnIndex = sender.convert(sender.bounds.origin, to:self.tblOrderSummary)
        
        if let _ = self.tblOrderSummary.indexPathForRow(at: btnIndex) {
            let storyBoard = UIStoryboard(name: "MyCart", bundle: nil)
            let controller = storyBoard.instantiateViewController(withIdentifier: "ConfirmOrderVC") as! ConfirmOrderVC
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
    }
    
}

// MARK: - Order Summary Table Logic
extension OrderSummaryVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        
        switch index {
        
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentMethodTableViewCell") as! PaymentMethodTableViewCell
                return cell
                
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ApplyCouponTableViewCell") as! ApplyCouponTableViewCell
                return cell
            
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ReferralCodeTableViewCell") as! ReferralCodeTableViewCell
                return cell
            
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "GiftCertificateTableViewCell") as! GiftCertificateTableViewCell
                return cell
                
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "PatricksStoreWalletTableViewCell") as! PatricksStoreWalletTableViewCell
                return cell
                
            default:
                return UITableViewCell()
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let index = indexPath.row
        
        switch index {
        
            case 0:
                return 165.0
                
            case 1:
                return 145.0
            
            case 2:
                return 145.0
            
            case 3:
                return 212.0
            
            case 4:
                return 200.0
                
            default:
                return 0
        }
    }
    
}
