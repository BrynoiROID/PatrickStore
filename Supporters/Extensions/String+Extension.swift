//
//  String+Extension.swift
//  PatricksStore
//
//  Created by MacBook on 21/12/21.
//

import Foundation

extension String {
    func strikethroughStyle() -> NSAttributedString {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
    func encodeUrl() -> String {
        return self.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
}
