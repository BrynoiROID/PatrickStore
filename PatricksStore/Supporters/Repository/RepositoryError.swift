//
//  RepositoryError.swift
//  Ryon
//
//  Created by Renjithnath on 04/03/21.
//

import Foundation


extension Repository {
    public enum ErrorCode: Int {
        case unknown
        case networkConnectionError = -1001
        case networkConnectionLost = -1009
        case sessionTimeout = 401
        case parsingError = -2
        case validation = -3
        case maintanance = 503
    }
}
