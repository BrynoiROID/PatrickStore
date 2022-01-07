//
//  ChangePasswordViewModel.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 23/09/21.
//

import Foundation

class ChangePasswordViewModel {
    
    //MARK: - Check if Password and Confirm Password are the same
    func isChangePasswordValid(newPassword: String, confirmPassword: String) -> Bool {
        
        if newPassword == "" {
            Helper.showAlert(message: "Please enter the new password.")
            
        } else if confirmPassword == "" {
            Helper.showAlert(message: "Please enter the confirm password.")
            
        } else if confirmPassword != newPassword {
            Helper.showAlert(message: "Confirm password not match.")
            
        } else {
            return true
        }
        return false
    }
    
}
