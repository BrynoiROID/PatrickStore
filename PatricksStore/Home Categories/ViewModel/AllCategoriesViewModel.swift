//
//  AllCategoriesViewModel.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 11/01/22.
//

import Foundation

import Alamofire

class AllCategoriesViewModel {
    //MARK: - Product List API Call
    public func ProductDataFetchAPI(completion: @escaping(ProductData)-> Void){
        let header : HTTPHeaders = ["Authorization": Helper.getLoggedinUser()!.jwtToken!]
        var url = "customer-product/bycat"
        let urlsURL = URL(string: url)!
        let queryItems = [URLQueryItem(name: "page", value: "1"),
                          URLQueryItem(name: "limit", value: "10"),
                          URLQueryItem(name: "categoryId", value: "605ae154acb98657d6f034c9"),
                          URLQueryItem(name: "isPerishable", value: "true")]
        url = urlsURL.appending(queryItems)!
        WebServices.sharedApiInstance.productListApi(strUrl: Helper.appBaseURL+url,header: header) { (result) in
            switch result {
            case .success(let result) :
                if result.statusCode == 200 {
                    completion(result.data!)
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
