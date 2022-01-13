//
//  SetLocationModel.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 13/01/22.
//

import Foundation

struct LocationSetParams: Encodable{
    let deviceId: String
    let location: LocationParams
}
struct LocationParams: Encodable{
    let lat: String
    let lng: String
}
