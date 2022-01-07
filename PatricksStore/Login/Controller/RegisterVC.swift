//
//  RegisterVC.swift
//  PatricksStore
//
//  Created by Admin on 19/08/21.
//

import UIKit
import SkyFloatingLabelTextField

class RegisterVC: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var gradientView: UIView!
    
    @IBOutlet weak var firstNameTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var lastNameTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var emailIDTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var mobileNumberTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var confirmPasswordTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var checkboxButton: UIButton!
    
    @IBOutlet weak var checkboxView: UIView!
    
    //MARK: - Variables and Constants
    var checkboxFlag = false
    
    var viewModel = RegisterViewModel()
    
    var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [Helper.colorFromHexString(hex: "#A86B19").cgColor, Helper.colorFromHexString(hex: "#E8C14F").cgColor, Helper.colorFromHexString(hex: "#C78732").cgColor, Helper.colorFromHexString(hex: "#E8C348").cgColor, Helper.colorFromHexString(hex: "#E8C348").cgColor]
        gradientLayer.startPoint = CGPoint.zero
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = CGRect.zero
        return gradientLayer
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Set status bar color
        Helper.StatusBarColor(view: self.view)
        
        // Gradient View Settings
        gradientView.layer.addSublayer(gradientLayer)
        gradientLayer.frame = gradientView.bounds
        
        // Password TextField
        self.passwordTextField.enablePasswordToggle()
        
        // Confirm Password TextField
        self.confirmPasswordTextField.enablePasswordToggle()
        
        // Checkbox View
        checkboxView.layer.cornerRadius = 4.0
    }
    
    //MARK: - Checkbox Button Action
    @IBAction func checkboxButtonTapped(_ sender: UIButton) {
        if checkboxFlag == false {
            checkboxButton.setTitle("✓", for: .normal)
            checkboxFlag = true
        } else {
            checkboxButton.setTitle("", for: .normal)
            checkboxFlag = false
        }
    }
    
    //MARK: - Register Button Action
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        registerApiCheckConnectivity()
//        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
//        let controller = storyBoard.instantiateViewController(withIdentifier: "SetLocationVC") as! SetLocationVC
//        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - Facebook Button Action
    @IBAction func facebookButtonTapped(_ sender: UIButton) {
        Helper.showAlert(message: "Facebook Button Tapped")
    }
    
    //MARK: - Google Button Action
    @IBAction func googleButtonTapped(_ sender: UIButton) {
        Helper.showAlert(message: "Google Button Tapped")
    }
    
    //MARK: - Login Button Action
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
//MARK:- API CALL
extension RegisterVC{
    func registerApiCheckConnectivity() {
        if Helper.checkInternetConnectivity() {
            if viewModel.isRegisterValid(firstname: self.firstNameTextField.text!, lastname: self.lastNameTextField.text!, emailid: self.emailIDTextField.text!, mobilenumber: self.mobileNumberTextField.text!, password: self.passwordTextField.text!, cnfrmpassword: self.confirmPasswordTextField.text!, checkboxselected: self.checkboxFlag){
                viewModel.RegisterAPI(firstname: self.firstNameTextField.text!, lastname: self.lastNameTextField.text!, email: self.emailIDTextField.text!, mobile: self.mobileNumberTextField.text!, password: self.passwordTextField.text!) {[self](result) in
                    DispatchQueue.main.async {
                        let storyBoard = UIStoryboard(name: "Login", bundle: nil)
                        let controller = storyBoard.instantiateViewController(withIdentifier: "OTPVC") as! OTPVC
                        print(result.otp)
                        controller.otp = String(result.otp!)
                        self.navigationController?.pushViewController(controller, animated: true)
                    }
                }
            }
        }else {
            Helper.showAlert(message: "Please check your Internet connection")
        }
    }
}
