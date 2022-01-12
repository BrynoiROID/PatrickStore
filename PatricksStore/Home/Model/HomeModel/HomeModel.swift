//
//  HomeModel.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 29/12/21.
//

import Foundation

struct HomeModel : Decodable {
    let msg : String?
    let data : [HomeData]?
    let statusCode : Int?
    let error : Bool?
}
struct HomeData : Decodable {
    let item : String?
    let position : Int?
    let title : String?
    let banner : [Banner]?
    let slider : [Banner]?
    let shop : [ShopData]?
    let productCategory : [ProductCategory]?
}
struct Banner : Decodable {
    let product : [String]?
    let otherImage : [String]?
    let category : String?
    let title : String?
    let type : String?
    let mainImage : MainImage?
    let sellerId : String?
    let __v : Int?
    let id : String?
}
struct ShopData : Decodable {
    let _id : String?
    let name : String?
    let uniqueName : String?
    let isPerishable : Bool?
    let createdAt : String?
    let updatedAt : String?
    let __v : Int?
    let shops : [Shops]?
}
struct Shops : Decodable {
    let sellerName : String?
    let profileImageId : MainImage?
    let shopCatId : ShopCatId?
    let id : String?
}
struct ShopCatId : Decodable {
    let _id : String?
    let name : String?
}
struct MainImage : Decodable {
    let _id : String?
    let publicUrl : String?
}
struct ProductCategory : Decodable {
    let _id : String?
    let name : String?
    let uniqueName : String?
    let adminCommissionPercentage : Int?
    let parentId : String?
    let createdAt : String?
    let updatedAt : String?
    let __v : Int?
    let franchiseCommissionPercentage : Int?
    let isPerishable : Bool?
    let products : [Products]?
}
struct Products : Decodable {
    let imgUrl : [MainImage]?
    let reviews : [String]?
    let franchiseId : String?
    let sellerId : String?
    let productTypeId : String?
    let name : String?
    let description : String?
    let color : String?
    let size : String?
    let actualPrice : Double?
    //let maxDiscount : Int?
    let maxDiscount : Double?
    //let offerPrice : Int?
    let offerPrice : Double?
    let discountDateFrom : String?
    let discountDateTo : String?
    let category : String?
    let quantity : Int?
    let minQunatity : Int?
    let maxQuantity : Int?
    let canSubtractStock : Bool?
    let model : String?
    let tag : String?
    let length : String?
    let width : String?
    let height : String?
    let weight : String?
    let isApproved : Bool?
    let isRejected : Bool?
    let isEnabled : Bool?
    let __v : Int?
    let adminCommission : Int?
    let adminCommissionAmount : Double?
    let costPrice : Double?
    let productId : Int?
    let shopAmount : Double?
    let shopDiscount : Int?
    let franchiseCommissionAmount : Double?
    let options : [String]?
    let id : String?
    let type : String?
}
