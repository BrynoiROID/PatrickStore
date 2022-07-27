//
//  Log.swift
//  Ryon
//
//  Created by Renjithnath on 16/07/21.
//

import Foundation

struct Log {
    static func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        if Configuration.isDebug {
            Swift.print(items, separator: separator, terminator: terminator)
        }
    }
    
    static func debugPrint(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        if Configuration.isDebug {
            Swift.debugPrint(items, separator: separator, terminator: terminator)
        }
    }
}
