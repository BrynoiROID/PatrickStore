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
    public func ProductDataFetchAPI(catModel: CategoryData,completion: @escaping(ProductData)-> Void){
        let header : HTTPHeaders = ["Authorization": Helper.getLoggedinUser()!.jwtToken!]
        var url = "customer-product/bycat"
        let urlsURL = URL(string: url)!
        let queryItems = [URLQueryItem(name: "page", value: "1"),
                          URLQueryItem(name: "limit", value: catModel.limit),
                          URLQueryItem(name: "categoryId", value: catModel.categoryId),
                          URLQueryItem(name: "isPerishable", value: catModel.isPerishable)]
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
                Helper.showAlert(message: err.localizedDescription)
                break
            }
        }
    }
}
