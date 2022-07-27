//
//  RepositorySuccessResponse.swift
//  VFECommerce
//
//  Created by Renjithnath on 26/09/21.
//

import Foundation

extension Repository {
    struct SuccessResponse: Codable {
        let statusCode: Int
        let msg: String?
        let error: Bool?
    }
}
