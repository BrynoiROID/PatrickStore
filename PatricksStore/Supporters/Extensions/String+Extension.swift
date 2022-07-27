//
//  String+Extension.swift
//  VFECommerce
//
//  Created by Renjithnath on 02/10/21.
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
