//
//  MyAddressViewModel.swift
//  PatricksStore
//
//  Created by MacBook on 07/01/22.
//

import Foundation
//MARK:- Listing Address API Call
class MyAddressViewModel{
    public func ListAddressAPI(completion: @escaping(MyAddressData)-> Void){
        WebServices.sharedApiInstance.listAddressApi(url: Helper.appBaseURL+"customer-accounts/address/list/all") { (result) in
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
    
    //MARK:- Delete Address API Call
    public func DeleteAddressAPI(addressId:String,completion: @escaping(AddAddressModel)-> Void){
        WebServices.sharedApiInstance.deleteAddressApi(url: Helper.appBaseURL+"customer-accounts/address/delete/\(addressId)") { (result) in
            switch result {
            
            case .success(let result) :
                if result.statusCode == 200 {
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
