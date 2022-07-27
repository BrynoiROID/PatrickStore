//
//  RepoServiceManager.swift
//  ThafseerAmani
//
//  Created by Renjithnath on 20/03/21.
//

import Foundation
import Alamofire

extension Repository {
    enum ContentType: String {
        case json = "application/json"
        case x_www_form_urlencoded = "application/x-www-form-urlencoded"
        case texthtml = "text/html"
    }

    enum HeaderParams: String {
        case userId = "userid"
        case machineName = "MachineName"
        case domain = "Domain"
        case ipName = "IpName"
        case securityKey = "securitykey"
        case securityPassword = "securitypassword"
        case password
    }
    
    enum Header: String {
        case Authorization = "Authorization"
    }
}

