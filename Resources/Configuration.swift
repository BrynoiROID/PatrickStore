//
//  Configurations.swift
//  PatricksStore
//
//  Created by MacBook on 21/12/21.
//

import Foundation

struct Configuration {
    
    static func infoForKey(_ key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)?
            .replacingOccurrences(of: Constants.BACKWARD_SLASHES, with: Constants.EMPTY_STRING)
    }
    
    static func infoFor(dictionaryKey: String, stringKey: String) -> String? {
        let dictionary = Bundle.main.infoDictionary?[dictionaryKey] as? [String: Any]
        let string = dictionary?[stringKey] as? String
        return string?.replacingOccurrences(of: Constants.BACKWARD_SLASHES, with: Constants.EMPTY_STRING)
    }
    
    static func configurationFor(dictionaryKey: String, stringKey: String) -> String? {
        let dictionary = (Bundle.main.infoDictionary?[Constants.CONFIGURATIONS] as? [String: Any])?[dictionaryKey] as? [String: Any]
        let string = dictionary?[stringKey] as? String
        return string?.replacingOccurrences(of: Constants.BACKWARD_SLASHES, with: Constants.EMPTY_STRING)
    }
    
    struct API {
        static let SERVICE_ROOT = configurationFor(dictionaryKey: "API", stringKey: "API_SERVICE_ROOT")!
        static let SERVICE_PRODUCT_FOLDER = configurationFor(dictionaryKey: "API", stringKey: "API_SERVICE_PRODUCT_FOLDER")!
        static let SERVICE_ACCOUNT_FOLDER = configurationFor(dictionaryKey: "API", stringKey: "API_SERVICE_ACCOUNT_FOLDER")!
    }
    
    static var isDebug: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
    enum whichFolder {
        case PRODUCT
        case ACCOUNT
    }
}
