//
//  RecoverPasswordVC.swift
//  PatricksStore
//
//  Created by Admin on 18/08/21.
//

import UIKit
import SkyFloatingLabelTextField

class RecoverPasswordVC: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var mobileNumberTextField: SkyFloatingLabelTextField!
    
    //MARK: - Variables and Constants
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        Helper.StatusBarColor(view: self.view)
    }
    
    // MARK: - Button Actions
    
    // Back Button Action
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // OTP Button Action
    @IBAction func sendOTPButtonTapped(_ sender: UIButton) {
        self.checkConnectivity()
    }
    
}

//MARK: - API Call
extension RecoverPasswordVC {
    
    func checkConnectivity() {
        
        if Helper.checkInternetConnectivity() {
            
            if viewModel.isMobileNumberValid(mobileNumber: self.mobileNumberTextField.text!) {
                let storyBoard = UIStoryboard(name: "Login", bundle: nil)
                let controller = storyBoard.instantiateViewController(withIdentifier: "OTPVC") as! OTPVC
                self.navigationController?.pushViewController(controller, animated: true)
            }
            
        } else {
            Helper.showAlert(message: "Please check your Internet connection")
        }
    }
}
