//
//  LoginViewModel.swift
//  PatricksStore
//
//  Created by Admin on 17/08/21.
//

import Foundation

class LoginViewModel {
    
    // Login Validation
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
    
    // Mobile Number Validation
    func isMobileNumberValid(mobileNumber: String) -> Bool {
        if mobileNumber.count != 10 {
            Helper.showAlert(message: "Please enter a valid mobile number.")
        } else {
            return true
        }
        return false
    }
    
    //MARK: - Login API Call
    public func LoginAPI(email:String,password:String,completion: @escaping()-> Void){
        let params = LoginParams(userName: email, password: password)
        //let param = ["userName":email,"password":password]
        WebServices.sharedApiInstance.otpApi(url: Helper.appBaseURL+"customer-accounts/login", parameter: params) { (result) in
            switch result {
            
            case .success(let result) :
                if result.statusCode == 200 {
                    Helper.clearUserDefaults()
                    Helper.setLoggedinUser(loggedUser: result.data!)
                    completion()
                } else {
                    Helper.showAlert(message: result.msg!)
                }
                
            case .failure(let err) :
                print("API Error", err)
                Helper.showAlert(message: "Something went wrong")
                break
            }
        }
    }
    
}
struct LoginParams: Encodable {
    let userName: String
    let password: String
}
