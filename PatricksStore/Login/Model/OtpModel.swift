//
//  OtpModel.swift
//  PatricksStore
//
//  Created by MacBook on 21/12/21.
//

import Foundation
struct OtpModel : Codable {
    let data : OtpData?
    let msg : String?
    let statusCode : Int?
    let error : Bool?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case msg = "msg"
        case statusCode = "statusCode"
        case error = "error"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(OtpData.self, forKey: .data)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        statusCode = try values.decodeIfPresent(Int.self, forKey: .statusCode)
        error = try values.decodeIfPresent(Bool.self, forKey: .error)
    }

}
struct OtpData : Codable {
    let firstName : String?
    let lastName : String?
    let email : String?
    let mobile : String?
    let imageUrl : String?
    let jwtToken : String?

    enum CodingKeys: String, CodingKey {

        case firstName = "firstName"
        case lastName = "lastName"
        case email = "email"
        case mobile = "mobile"
        case imageUrl = "imageUrl"
        case jwtToken = "jwtToken"
    }

}
