//
//  RepositoryURLMaker.swift
//  PatricksStore
//
//  Created by MacBook on 21/12/21.
//

import Foundation

extension Repository {
    struct URLMaker {
        static func apiProductURLStringFrom(
            endpoint: String
        ) -> String {
            Configuration.API.SERVICE_ROOT + Configuration.API.SERVICE_PRODUCT_FOLDER + endpoint
        }
        
        static func apiAccountURLStringFrom(
            endpoint: String
        ) -> String {
            Configuration.API.SERVICE_ROOT + Configuration.API.SERVICE_ACCOUNT_FOLDER + endpoint
        }
        
        static func imageURLStringFrom(
            endpoint: String
        ) -> String {
            Configuration.API.SERVICE_ROOT + endpoint.encodeUrl()
        }
    }
}

extension String {
    func makeImageUrl() -> URL? {
        URL(string: Repository.URLMaker.imageURLStringFrom(endpoint: self))
    }
}
