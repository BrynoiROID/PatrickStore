//
//  WebServices.swift
//  PatricksStore
//
//  Created by MacBook on 21/12/21.
//

import Foundation

import Alamofire

class WebServices{
    static let sharedApiInstance = WebServices()
    
    //MARK: - POST API's
    //MARK: - Register API Call
    func registerApi(url:String,parameter:Parameters,completion: @escaping (Result<RegisterModel,Error>) -> ()) {
        LoadingIndicatorView.show()
        AF.request(url, method: .post, parameters: parameter, encoding: URLEncoding.httpBody, headers: nil).responseJSON { (response) in
            LoadingIndicatorView.hide()
            if response.response?.statusCode == 200 {
                guard let data = response.data else {return}
                do {
                    let modeldata = try JSONDecoder().decode(RegisterModel.self, from: data)
                    completion(.success(modeldata))
                } catch let err {
                    completion(.failure(err))
                }
            } else {
                if response.response?.statusCode == 404{
                    Helper.showAlert(message: "Page Not Found!")
                    
                }else if response.response?.statusCode == 401{
                    Helper.showAlert(message: "Unauthorized")
                    
                }else if response.response?.statusCode == 400{
                    Helper.showAlert(message: "Unauthorized")
                    
                }else if response.response?.statusCode == 500{
                    Helper.showAlert(message: "Internal Server Error")
                    
                }else if response.response?.statusCode == 503{
                    Helper.showAlert(message: "Service Unavailable")
                    
                }else{
                    Helper.showAlert(message: "Somthing Went Wrong!")
                    
                }
            }
        }
    }
    //MARK: - Otp API Call
    func otpApi(url:String,parameter:Parameters,completion: @escaping (Result<OtpModel,Error>) -> ()) {
        LoadingIndicatorView.show()
        AF.request(url, method: .post, parameters: parameter, encoding: URLEncoding.httpBody, headers: nil).responseJSON { (response) in
            LoadingIndicatorView.hide()
            if response.response?.statusCode == 200 {
                guard let data = response.data else {return}
                do {
                    let modeldata = try JSONDecoder().decode(OtpModel.self, from: data)
                    completion(.success(modeldata))
                } catch let err {
                    completion(.failure(err))
                }
            } else {
                if response.response?.statusCode == 404{
                    Helper.showAlert(message: "Page Not Found!")
                    
                }else if response.response?.statusCode == 401{
                    Helper.showAlert(message: "Unauthorized")
                    
                }else if response.response?.statusCode == 400{
                    Helper.showAlert(message: "Unauthorized")
                    
                }else if response.response?.statusCode == 500{
                    Helper.showAlert(message: "Internal Server Error")
                    
                }else if response.response?.statusCode == 503{
                    Helper.showAlert(message: "Service Unavailable")
                    
                }else{
                    Helper.showAlert(message: "Somthing Went Wrong!")
                    
                }
            }
        }
    }
    //MARK:- Add Address API Call
    func addAddressApi(url:String,parameter:Parameters,completion: @escaping (Result<AddAddressModel,Error>) -> ()) {
        let header : HTTPHeaders = ["Authorization": Helper.getLoggedinUser()!.jwtToken!]
        LoadingIndicatorView.show()
        AF.request(url, method: .post, parameters: parameter, encoding: URLEncoding.httpBody, headers: header).responseJSON { (response) in
            LoadingIndicatorView.hide()
            if response.response?.statusCode == 200 {
                guard let data = response.data else {return}
                do {
                    let modeldata = try JSONDecoder().decode(AddAddressModel.self, from: data)
                    completion(.success(modeldata))
                } catch let err {
                    completion(.failure(err))
                }
            } else {
                if response.response?.statusCode == 404{
                    Helper.showAlert(message: "Page Not Found!")
                    
                }else if response.response?.statusCode == 401{
                    Helper.showAlert(message: "Unauthorized")
                    
                }else if response.response?.statusCode == 400{
                    Helper.showAlert(message: "Unauthorized")
                    
                }else if response.response?.statusCode == 500{
                    Helper.showAlert(message: "Internal Server Error")
                    
                }else if response.response?.statusCode == 503{
                    Helper.showAlert(message: "Service Unavailable")
                    
                }else{
                    Helper.showAlert(message: "Somthing Went Wrong!")
                    
                }
            }
        }
    }
    //MARK: - Get Api's
    //MARK: - Home API Call
        func homeApi(strUrl:String,parameter:Parameters,header: HTTPHeaders,completion: @escaping (Result<HomeModel,Error>) -> ()) {
            LoadingIndicatorView.show()
            let encoded = strUrl.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
            let url = URL(string: encoded!)
            AF.request(url!, method: .get, parameters: parameter, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
                LoadingIndicatorView.hide()
                if response.response?.statusCode == 200 {
                    guard let data = response.data else {return}
                    do {
                        let modeldata = try JSONDecoder().decode(HomeModel.self, from: data)
                        completion(.success(modeldata))
                    } catch let err {
                        completion(.failure(err))
                    }
                } else {
                    if response.response?.statusCode == 404{
                        Helper.showAlert(message: "Page Not Found!")
                    }else if response.response?.statusCode == 401{
                        Helper.showAlert(message: "Unauthorized")
                    }else if response.response?.statusCode == 400{
                        Helper.showAlert(message: "Unauthorized")
                    }else if response.response?.statusCode == 500{
                        Helper.showAlert(message: "Internal Server Error")
                    }else if response.response?.statusCode == 503{
                        Helper.showAlert(message: "Service Unavailable")
                    }else{
                        Helper.showAlert(message: "Somthing Went Wrong!")
                    }
                }
            }
        }
    //MARK:- Listing Address API
    func listAddressApi(url:String,completion: @escaping (Result<MyAddressModel,Error>) -> ()) {
        let header : HTTPHeaders = ["Authorization": Helper.getLoggedinUser()!.jwtToken!]
        LoadingIndicatorView.show()
       
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.httpBody, headers: header).responseJSON { (response) in
            LoadingIndicatorView.hide()
            if response.response?.statusCode == 200 {
                guard let data = response.data else {return}
                do {
                    let modeldata = try JSONDecoder().decode(MyAddressModel.self, from: data)
                    completion(.success(modeldata))
                } catch let err {
                    completion(.failure(err))
                }
            } else {
                if response.response?.statusCode == 404{
                    Helper.showAlert(message: "Page Not Found!")
                    
                }else if response.response?.statusCode == 401{
                    Helper.showAlert(message: "Unauthorized")
                    
                }else if response.response?.statusCode == 400{
                    Helper.showAlert(message: "Unauthorized")
                    
                }else if response.response?.statusCode == 500{
                    Helper.showAlert(message: "Internal Server Error")
                    
                }else if response.response?.statusCode == 503{
                    Helper.showAlert(message: "Service Unavailable")
                    
                }else{
                    Helper.showAlert(message: "Somthing Went Wrong!")
                    
                }
            }
        }
    }
    //MARK:- Edit Address API Call
    func editAddressApi(url:String,completion: @escaping (Result<AddAddressModel,Error>) -> ()) {
        let header : HTTPHeaders = ["Authorization": Helper.getLoggedinUser()!.jwtToken!]
        LoadingIndicatorView.show()
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.httpBody, headers: header).responseJSON { (response) in
            LoadingIndicatorView.hide()
            if response.response?.statusCode == 200 {
                guard let data = response.data else {return}
                do {
                    let modeldata = try JSONDecoder().decode(AddAddressModel.self, from: data)
                    completion(.success(modeldata))
                } catch let err {
                    completion(.failure(err))
                }
            } else {
                if response.response?.statusCode == 404{
                    Helper.showAlert(message: "Page Not Found!")
                    
                }else if response.response?.statusCode == 401{
                    Helper.showAlert(message: "Unauthorized")
                    
                }else if response.response?.statusCode == 400{
                    Helper.showAlert(message: "Unauthorized")
                    
                }else if response.response?.statusCode == 500{
                    Helper.showAlert(message: "Internal Server Error")
                    
                }else if response.response?.statusCode == 503{
                    Helper.showAlert(message: "Service Unavailable")
                    
                }else{
                    Helper.showAlert(message: "Somthing Went Wrong!")
                    
                }
            }
        }
    }
    
    //MARK:- PATCH API's
    //MARK:- Update Address API Call
    func updateAddressApi(url:String,parameter:Parameters,completion: @escaping (Result<AddAddressModel,Error>) -> ()) {
        let header : HTTPHeaders = ["Authorization": Helper.getLoggedinUser()!.jwtToken!]
        LoadingIndicatorView.show()
        AF.request(url, method: .patch, parameters: parameter, encoding: URLEncoding.httpBody, headers: header).responseJSON { (response) in
            LoadingIndicatorView.hide()
            if response.response?.statusCode == 200 {
                guard let data = response.data else {return}
                do {
                    let modeldata = try JSONDecoder().decode(AddAddressModel.self, from: data)
                    completion(.success(modeldata))
                } catch let err {
                    completion(.failure(err))
                }
            } else {
                if response.response?.statusCode == 404{
                    Helper.showAlert(message: "Page Not Found!")
                    
                }else if response.response?.statusCode == 401{
                    Helper.showAlert(message: "Unauthorized")
                    
                }else if response.response?.statusCode == 400{
                    Helper.showAlert(message: "Unauthorized")
                    
                }else if response.response?.statusCode == 500{
                    Helper.showAlert(message: "Internal Server Error")
                    
                }else if response.response?.statusCode == 503{
                    Helper.showAlert(message: "Service Unavailable")
                    
                }else{
                    Helper.showAlert(message: "Somthing Went Wrong!")
                    
                }
            }
        }
    }
    //MARK:- DELETE API's
    //MARK:- Delete Address API Call
    func deleteAddressApi(url:String,completion: @escaping (Result<AddAddressModel,Error>) -> ()) {
        let header : HTTPHeaders = ["Authorization": Helper.getLoggedinUser()!.jwtToken!]
        LoadingIndicatorView.show()
        AF.request(url, method: .delete, parameters: nil, encoding: URLEncoding.httpBody, headers: header).responseJSON { (response) in
            LoadingIndicatorView.hide()
            if response.response?.statusCode == 200 {
                guard let data = response.data else {return}
                do {
                    let modeldata = try JSONDecoder().decode(AddAddressModel.self, from: data)
                    completion(.success(modeldata))
                } catch let err {
                    completion(.failure(err))
                }
            } else {
                if response.response?.statusCode == 404{
                    Helper.showAlert(message: "Page Not Found!")
                    
                }else if response.response?.statusCode == 401{
                    Helper.showAlert(message: "Unauthorized")
                    
                }else if response.response?.statusCode == 400{
                    Helper.showAlert(message: "Unauthorized")
                    
                }else if response.response?.statusCode == 500{
                    Helper.showAlert(message: "Internal Server Error")
                    
                }else if response.response?.statusCode == 503{
                    Helper.showAlert(message: "Service Unavailable")
                    
                }else{
                    Helper.showAlert(message: "Somthing Went Wrong!")
                    
                }
            }
        }
    }
}
    
