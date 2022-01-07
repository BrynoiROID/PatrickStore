//
//  LoginVC.swift
//  PatricksStore
//
//  Created by Admin on 17/08/21.
//

import UIKit
import SkyFloatingLabelTextField

class LoginVC: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var recoverPasswordLabel: UILabel!
    
    //MARK: - Variables and Constants
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        Helper.StatusBarColor(view: self.view)
        passwordTextField.enablePasswordToggle()
    }
    
    //MARK: - Button Actions
    
    // Login Button Action
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        self.checkConnectivity()
    }
    
    // Recover Password Button Action
    @IBAction func recoverPasswordButtonTapped(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Login", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "RecoverPasswordVC") as! RecoverPasswordVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    // Facebook Login Button Action
    @IBAction func facebookLoginButtonTapped(_ sender: UIButton) {
    }
    
    // Google Login Button Action
    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
    }
    
    // Apple Login Button Action
    @IBAction func appleLoginButtonTapped(_ sender: UIButton) {
    }
    
    // Create Account Button Action
    @IBAction func createAccountButtonTapped(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Login", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

//MARK: - API Call
extension LoginVC {
    func checkConnectivity() {
        if Helper.checkInternetConnectivity() {
            if viewModel.isLoginValid(username: self.emailTextField.text!, password: self.passwordTextField.text!) {
                viewModel.LoginAPI(email: self.emailTextField.text!, password: self.passwordTextField.text!) {
                    DispatchQueue.main.async {
                        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
                        let controller = storyBoard.instantiateViewController(withIdentifier: "SetLocationVC") as! SetLocationVC
                        self.navigationController?.pushViewController(controller, animated: true)
                        
                    }
                }
            } else {
                Helper.showAlert(message: "Please check your Internet connection")
            }
        }
    }
    
}
