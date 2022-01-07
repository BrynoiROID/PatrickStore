//
//  HomeViewModel.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 29/12/21.
//

import Foundation

import Alamofire

class HomeViewModel {
    //MARK: - Home API Call
    public func HomeDataFetchAPI(latitude:String,longitude:String,completion: @escaping(HomeModel)-> Void){
        let param = ["lat":"11","lng":"76"]
        let header : HTTPHeaders = ["Authorization": Helper.getLoggedinUser()!.jwtToken!]
        WebServices.sharedApiInstance.homeApi(strUrl: Helper.appBaseURL+"customer-accounts/dashboard", parameter:param, header: header) { (result) in
            switch result {
            case .success(let result) :
                if result.statusCode == 200 {
                    completion(result)
                }else {
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
