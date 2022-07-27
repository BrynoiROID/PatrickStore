//
//  RepositorySuccessResponse.swift
//  PatricksStore
//
//  Created by MacBook on 21/12/21.
//

import Foundation

extension Repository {
    struct SuccessResponse: Codable {
        let statusCode: Int
        let msg: String?
        let error: Bool?
    }
}
