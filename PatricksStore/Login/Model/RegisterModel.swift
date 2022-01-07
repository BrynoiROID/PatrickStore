//
//  RegisterModel.swift
//  PatricksStore
//
//  Created by MacBook on 21/12/21.
//

import Foundation
class RegisterModel : Codable {
    let data : RegisterData?
    let msg : String?
    let statusCode : Int?
    let error : Bool?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case msg = "msg"
        case statusCode = "statusCode"
        case error = "error"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(RegisterData.self, forKey: .data)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        statusCode = try values.decodeIfPresent(Int.self, forKey: .statusCode)
        error = try values.decodeIfPresent(Bool.self, forKey: .error)
    }

}
struct RegisterData : Codable {
    let customerId : String?
    let otp : Int?

    enum CodingKeys: String, CodingKey {

        case customerId = "customerId"
        case otp = "otp"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        customerId = try values.decodeIfPresent(String.self, forKey: .customerId)
        otp = try values.decodeIfPresent(Int.self, forKey: .otp)
    }

}

