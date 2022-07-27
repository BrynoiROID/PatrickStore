//
//  RepositoryRequestParameter.swift
//  PatricksStore
//
//  Created by MacBook on 21/12/21.
//

import Foundation

protocol RepositoryRequestParameterProtocol: Encodable {
    var userid: String { set get }
    var MachineName: String { set get }
    var Domain: String { set get }
    var IpName: String { set get }
    var securitykey: String { set get }
    var securitypassword: String { set get }
}
