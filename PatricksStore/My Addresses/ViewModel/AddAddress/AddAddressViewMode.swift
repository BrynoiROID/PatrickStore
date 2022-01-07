//
//  AddAddressViewMode.swift
//  PatricksStore
//
//  Created by MacBook on 07/01/22.
//

import Foundation
class AddAddressViewModel{
    
    //MARK:- Validation
    func AddAddressValid(pincode: String,houseno: String,roadname: String,city: String, state: String,landmark: String,name:String,mobilenumber: String) -> Bool {
        
        if pincode == "" {
            Helper.showAlert(message: "Please enter the pincode.")
            
        }else if houseno == "" {
            Helper.showAlert(message: "Please enter the buildingname.")
            
        }else if roadname == "" {
            Helper.showAlert(message: "Please enter the roadname.")
            
        }else if city == "" {
            Helper.showAlert(message: "Please enter the city.")
            
        }else if state == "" {
            Helper.showAlert(message: "Please enter the state.")
            
        }else if landmark == "" {
            Helper.showAlert(message: "Please enter the landmark.")
            
        }else if name == "" {
            Helper.showAlert(message: "Please enter the name.")
            
        }else if mobilenumber.count != 10 {
            Helper.showAlert(message: "Please enter a valid mobile number.")
            
        }else {
            return true
        }
        
        return false
    }
    
    //MARK:- Add Address
    public func AddAdresssAPI(name:String,address1:String,city:String,state:String,pincode:String,landMark:String,label:String,lat:String,lng:String,contactNumber:String,completion: @escaping()-> Void){
        let param = ["name":name,"address1":address1,"city":city,"state":state,"country":"india","pincode":pincode,"landMark":landMark,"label":label,"lat":lat,"lng":lng,"contactNumber":contactNumber]
        WebServices.sharedApiInstance.addAddressApi(url: Helper.appBaseURL+"customer-accounts/address", parameter: param) { (result) in
            switch result {
            
            case .success(let result) :
                if result.statusCode == 200 {
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
    
    //MARK:- Edit Address
    public func EditAddressAPI(addressId:String,completion: @escaping(AddAddressData)-> Void){
        WebServices.sharedApiInstance.editAddressApi(url: Helper.appBaseURL+"customer-accounts/address/\(addressId)") { (result) in
            switch result{
            
            case .success(let result):
                if result.statusCode == 200{
                    completion(result.data!)
                }else{
                    Helper.showAlert(message: result.msg!)
                }
            case .failure(let err):
                print("API Error", err)
                Helper.showAlert(message: "Something went wrong")
                break
            }
        }
    }
    
    //MARK:- Update Address
    public func UpdateAddressAPI(addressId:String,name:String,address1:String,city:String,state:String,pincode:String,landMark:String,label:String,lat:String,lng:String,contactNumber:String,completion: @escaping(AddAddressModel)-> Void){
        let param = ["addressId": addressId,"name":name,"address1":address1,"city":city,"state":state,"country":"india","pincode":pincode,"landMark":landMark,"label":label,"lat":lat,"lng":lng,"contactNumber":contactNumber]
        WebServices.sharedApiInstance.updateAddressApi(url: Helper.appBaseURL+"customer-accounts/address/update", parameter: param) { (result) in
            switch result{
            
            case .success(let result):
                if result.statusCode == 200{
                    completion(result)
                }else{
                    Helper.showAlert(message: result.msg!)
                }
            case .failure(let err):
                print("API Error", err)
                Helper.showAlert(message: "Something went wrong")
                break
            }
        }
    }
}
