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
    public func HomeDataFetchAPI(completion: @escaping(HomeModel)-> Void){
        let header : HTTPHeaders = ["Authorization": Helper.getLoggedinUser()!.jwtToken!]
        WebServices.sharedApiInstance.homeApi(strUrl: Helper.appBaseURL+"customer-accounts/dashboard",header: header) { (result) in
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
    //MARK: - SideMenu Service API Call
    public func ServiceDataFetchAPI(completion: @escaping(ServiceCategoryModel)-> Void){
        let header : HTTPHeaders = ["Authorization": Helper.getLoggedinUser()!.jwtToken!]
        WebServices.sharedApiInstance.serviceCategoryApi(strUrl: Helper.appBaseURL+"customer-seller/service-category/list", header: header) { (result) in
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
    //MARK: - SideMenu Product API Call
    public func ProductDataFetchAPI(completion: @escaping(ProductCategoryModel)-> Void){
        let header : HTTPHeaders = ["Authorization": Helper.getLoggedinUser()!.jwtToken!]
        WebServices.sharedApiInstance.productCategoryApi(strUrl: Helper.appBaseURL+"customer-product/categories", header: header) { (result) in
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
    //MARK: - Add To Cart  API Call
    public func ProductAddToCartAPI(product: Products,completion: @escaping(ProductCategoryModel)-> Void){
        let header : HTTPHeaders = ["Authorization": Helper.getLoggedinUser()!.jwtToken!]
        var url = "customer-product/cart/add"
        let urlsURL = URL(string: url)!
        let queryItems = [URLQueryItem(name: "product", value: product.id),
                          URLQueryItem(name: "quantity", value: "1")]
        url = urlsURL.appending(queryItems)!
        WebServices.sharedApiInstance.addToCartProductApi(strUrl: Helper.appBaseURL+url, header: header) { (result) in
            switch result {
            case .success(let result) :
                if result.statusCode == 200 {
                    //completion()
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
