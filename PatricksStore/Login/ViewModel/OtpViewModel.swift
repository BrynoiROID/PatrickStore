//
//  OtpViewModel.swift
//  PatricksStore
//
//  Created by MacBook on 21/12/21.
//

import Foundation

class OtpViewModel  {
    //MARK:- Validation function
    func isValid(otp : String,codeno : String) -> Bool {
        if otp != codeno{
            Helper.showAlert(message: "Otp not matching")
        }else {
            return true
        }
            return false
    }
    
    //MARK:- Verify OTP function
    public func OtpAPI(otp:String,completion: @escaping((OtpModel))-> Void){
        let param = ["otp":otp]
        WebServices.sharedApiInstance.otpApi(url: Helper.appBaseURL+"customer-accounts/otp/verify", parameter: param) { (result) in
            switch result {
            
            case .success(let result) :
                if result.statusCode == 200 {
                        //Set,Clear Common User Objet
                        Helper.clearUserDefaults()
                        Helper.setLoggedinUser(loggedUser: result.data!)
                        completion(result)
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
