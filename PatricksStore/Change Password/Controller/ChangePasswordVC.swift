//
//  ChangePasswordVC.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 23/09/21.
//

import UIKit

import SkyFloatingLabelTextField

class ChangePasswordVC: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet weak var bttnBack: UIButton!
    
    @IBOutlet weak var newPasswordTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var confirmPasswordTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var changePasswordButton: UIButton!
    
    //MARK: - Variables and Constants
    var viewModel = ChangePasswordViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        Helper.StatusBarColor(view: self.view)
        newPasswordTextField.enablePasswordToggle()
        confirmPasswordTextField.enablePasswordToggle()
    }
    
    //MARK: - Button Actions
    
    // Back Button Action
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // Change Password Button Action
    @IBAction func changePasswordButtonTapped(_ sender: UIButton) {
        self.checkConnectivity()
    }
}

// MARK: - API Call
extension ChangePasswordVC {
    func checkConnectivity() {
        if Helper.checkInternetConnectivity() {
            if viewModel.isChangePasswordValid(newPassword: self.newPasswordTextField.text!, confirmPassword: self.confirmPasswordTextField.text!) {
                // Change Password API Call
            }
        } else {
            Helper.showAlert(message: "Please check your Internet connection")
        }
    }
}
