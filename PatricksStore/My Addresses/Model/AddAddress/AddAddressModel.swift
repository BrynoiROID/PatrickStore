//
//  AddAddressModel.swift
//  PatricksStore
//
//  Created by MacBook on 07/01/22.
//

import Foundation
struct AddAddressModel : Codable {
    let data : AddAddressData?
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
        data = try values.decodeIfPresent(AddAddressData.self, forKey: .data)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        statusCode = try values.decodeIfPresent(Int.self, forKey: .statusCode)
        error = try values.decodeIfPresent(Bool.self, forKey: .error)
    }

}

struct AddAddressData : Codable {
    let name : String?
    let address1 : String?
    let address2 : String?
    let city : String?
    let state : String?
    let country : String?
    let pincode : String?
    let landMark : String?
    let label : String?
    let contactNumber : String?
    let id : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case address1 = "address1"
        case address2 = "address2"
        case city = "city"
        case state = "state"
        case country = "country"
        case pincode = "pincode"
        case landMark = "landMark"
        case label = "label"
        case contactNumber = "contactNumber"
        case id = "id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        address1 = try values.decodeIfPresent(String.self, forKey: .address1)
        address2 = try values.decodeIfPresent(String.self, forKey: .address2)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        pincode = try values.decodeIfPresent(String.self, forKey: .pincode)
        landMark = try values.decodeIfPresent(String.self, forKey: .landMark)
        label = try values.decodeIfPresent(String.self, forKey: .label)
        contactNumber = try values.decodeIfPresent(String.self, forKey: .contactNumber)
        id = try values.decodeIfPresent(String.self, forKey: .id)
    }

}
