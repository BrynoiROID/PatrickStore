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
    public func setLocationAPI(param: LocationSetParams,completion: @escaping(LocationUpdateModel)-> Void){
        let header: HTTPHeaders = ["Authorization": Helper.getLoggedinUser()!.jwtToken!]
        let param : Parameters = ["deviceId": param.deviceId,"location": ["lat":param.location.lat,"lng":param.location.lng]] as [String : Any]
        WebServices.sharedApiInstance.setLocationApi(strUrl: Helper.appBaseURL+"customer-accounts/location/set", header: header, params: param) { (result) in
            switch result {
                case .success(let result) :
                    if result.statusCode == 200 {
                        completion(result)
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
