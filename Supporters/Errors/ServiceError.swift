//
//  ServiceError.swift
//  PatricksStore
//
//  Created by MacBook on 21/12/21.
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
