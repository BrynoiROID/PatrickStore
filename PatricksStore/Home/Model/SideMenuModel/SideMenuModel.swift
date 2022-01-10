//
//  SideMenuModel.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 10/01/22.
//

import Foundation

struct ServiceCategoryModel : Decodable {
    let msg : String?
    let data : [ServiceCategoryData]?
    let statusCode : Int?
    let error : Bool?
}
struct ServiceCategoryData : Decodable {
    let name : String?
    let id : String?
}
struct ProductCategoryModel : Decodable {
    let msg : String?
    let statusCode : Int?
    let error : Bool?
    let data : [ProductCategoryData]?
}
struct ProductCategoryData : Decodable {
    let _id : String?
    let name : String?
    let uniqueName : String?
    let parentId : String?
    let isPerishable : Bool?
    let children : [String]?
}
