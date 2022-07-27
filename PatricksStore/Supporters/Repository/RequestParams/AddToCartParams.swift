//
//  AddToCartParams.swift
//  VFECommerce
//
//  Created by Renjithnath on 30/09/21.
//

import Foundation

struct AddToCartParams: RepositoryRequestParameterProtocol {
    var userid: String
    var MachineName: String
    var Domain: String
    var IpName: String
    var securitykey: String
    var securitypassword: String
    
}
