//
//  AllCategoriesModel.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 11/01/22.
//

import Foundation

struct ProductModel : Decodable {
    let data : ProductData?
    let msg : String?
    let statusCode : Int?
    let error : Bool?
}
struct ProductData : Decodable {
    let totalPages : Int?
    let hasNextPage : Bool?
    let perPage : Int?
    let totalCount : Int?
    let items : [Products]?
}
struct CategoryData {
    var limit : String?
    var categoryId : String?
    var isPerishable : String?
    init(limit: String? = nil,categoryId: String? = nil,isPerishable: String? = nil) {
        self.limit = limit
        self.categoryId = categoryId
        self.isPerishable = isPerishable
    }
}
