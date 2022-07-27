//
//  ServiceError.swift
//  VFECommerce
//
//  Created by Renjithnath on 26/09/21.
//

import Foundation

struct ServiceError {
    let description: String
    let data: Any?
    let errorCode: Int?
    
    enum ExceptionErrorCode: Int {
        case invalidToken = -1
        case unknown = -2
    }
}
