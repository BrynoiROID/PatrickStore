//
//  LoginViewModel.swift
//  PatricksStore
//
//  Created by Admin on 17/08/21.
//

import Foundation
import UIKit

class LoginViewModel {
    
    var itemsDidChange: ((Any?) -> Void)?
    
    var errorOccured: ((SystemError) -> Void)?
    
    var presentAlert: ((String) -> Void)?
    
    //MARK: - Login Validation
    
    func isLoginValid(username: String, password: String) -> Bool {
        
        if username == "" {
            Helper.showAlert(message: "Please enter the username.")

        } else if Helper.validateEmail(username) == false {

            if username.isNumeric == false {
                Helper.showAlert(message: "Please enter a valid email.")

            } else {
                if username.count != 10 {
                    Helper.showAlert(message: "Please enter a valid mobile number.")
                } else if password == "" {
                    Helper.showAlert(message: "Please enter the password.")
                } else {
                    return true
                }
            }

        } else {
            return true
            
        }
        return false
    }
    
    //MARK: -  Mobile Number Validation
    
    func isMobileNumberValid(mobileNumber: String) -> Bool {
        if mobileNumber.count != 10 {
            Helper.showAlert(message: "Please enter a valid mobile number.")
        } else {
            return true
        }
        return false
    }
    
    //MARK: - Login API Call

    func validateAndLogin(tfEmail: UITextField, tfPassword: UITextField, completion: @escaping () -> ()) {
        do {
            
            let email = try tfEmail.validatedText(validationType: .requiredField(field: "Email"))
            let password = try tfPassword.validatedText(validationType: .password)

            let params = LoginParams(userName: email, password: password)
            
            Repository.RequestingHelper.post(endPoint: Repository.Endpoints.LOGIN, parameter: params,apipointer: .ACCOUNT, responseCallBackOf: OtpData.self) { result in
                DispatchQueue.main.async {
                    UserManager.saveLogined(user: result)
                    self.itemsDidChange?(result)
                    completion()
                }
            } failure: { error in
                DispatchQueue.main.async {
                    self.presentAlert?(error.message)
                    completion()
                }
            }
        } catch {
            presentAlert?((error as! SystemError).message)
            completion()
        }
    }
    
}
struct LoginParams: Encodable {
    let userName: String
    let password: String
}
