//
//  Encodable+Extension.swift
//  PatricksStore
//
//  Created by MacBook on 21/12/21.
//

import Foundation

extension Encodable {
    var dictionary: [String: Any]? {
        do {
            let data = try JSONEncoder().encode(self)
            let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
            return dictionary
        } catch let err {
            print("Parsing Error", err)
            return nil
        }
    }
}

