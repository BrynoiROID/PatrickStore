//
//  AddToCartParams.swift
//  PatricksStore
//
//  Created by MacBook on 21/12/21.
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
