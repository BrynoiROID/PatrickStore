//
//  RegisterViewModel.swift
//  PatricksStore
//
//  Created by MacBook on 21/12/21.
//

import Foundation

class RegisterViewModel {
    
    // Register Validation
    func isRegisterValid(firstname: String,lastname: String,emailid: String,mobilenumber: String, password: String,cnfrmpassword: String,checkboxselected:Bool) -> Bool {
        
        if firstname == "" {
            Helper.showAlert(message: "Please enter the firstname.")
            
        } else if lastname == "" {
            Helper.showAlert(message: "Please enter the lastname.")
            
        } else if Helper.validateEmail(emailid) == false {
            Helper.showAlert(message: "Please enter a valid email.")
            
        } else if mobilenumber.count != 10 {
            Helper.showAlert(message: "Please enter a valid mobile number.")
            
        } else if password == "" {
            Helper.showAlert(message: "Please enter the password.")
            
        } else if cnfrmpassword == "" {
            Helper.showAlert(message: "Please enter the confirm password.")
            
        } else if password != cnfrmpassword {
            Helper.showAlert(message: "Passwords do not match")
            
        } else if checkboxselected == false {
            Helper.showAlert(message: "Please accept the terms and conditions")
            
        } else {
            return true
        }
        
        return false
    }
    
    //MARK:- Register API Call
    public func RegisterAPI(firstname:String,lastname:String,email:String,mobile:String,password:String,completion: @escaping((RegisterData))-> Void){
        let param = ["firstName":firstname,"lastName":lastname,"email":email,"mobile":mobile,"password":password]
        WebServices.sharedApiInstance.registerApi(url: Helper.appBaseURL+"customer-accounts/register", parameter: param) { (result) in
            switch result {
            
            case .success(let result) :
                if result.statusCode == 200 {
                    completion(result.data!)
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
