//
//  SetLocationViewModel.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 13/01/22.
//

import Foundation

import Alamofire

class SetLocationViewModel {
    //MARK: - Location Set API Call
    public func setLocationAPI(completion: @escaping(ProductCategoryModel)-> Void){
        let header : HTTPHeaders = ["Authorization": Helper.getLoggedinUser()!.jwtToken!]
        var parameters = [String: AnyObject]()
        parameters["deviceId"] = "fdfsdfsdf" as AnyObject
        parameters["location"] = ["lat":"20.465464","lng":"10.1275"] as AnyObject
//        let parameters: [String: Any] = [ "deviceId": "fdfsdfsdf","location": ["lat":"20.465464","lng":"10.1275"]]
        WebServices.sharedApiInstance.setLocationApi(strUrl: Helper.appBaseURL+"customer-accounts/location/set", header: header, params: parameters) { (result) in
            switch result {
            case .success(let result) :
                if result.statusCode == 200 {
                    //completion()
                }else {
                    Helper.showAlert(message: result.msg!)
                }
            case .failure(let err) :
                Helper.showAlert(message: err.localizedDescription)
                break
            }
        }
    }
}
