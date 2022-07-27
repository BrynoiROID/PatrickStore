//
//  Double+Extension.swift
//  PatricksStore
//
//  Created by MacBook on 21/12/21.
//

import Foundation

extension Double {
    func truncate(places : Int)-> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
    
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    func withCurrency(_ currency: String) -> String {
        "\(currency) \(self)"
    }
}

extension String {
    func withCurrency(_ currency: String) -> String {
        "\(currency) \(self)"
    }
}
