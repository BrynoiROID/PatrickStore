//
//  SetLocationModel.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 13/01/22.
//

import Foundation

struct LocationUpdateModel : Decodable {
    let data : LocationSuccessData?
    let msg : String?
    let statusCode : Int?
    let error : Bool?
}
struct LocationSuccessData : Codable {
    let msg : String?
}
struct LocationSetParams: Encodable{
    let deviceId: String
    let location: LocationParams
}
struct LocationParams: Encodable{
    let lat: String
    let lng: String
}
