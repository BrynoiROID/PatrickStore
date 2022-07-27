//
//  Repository.swift
//  PatricksStore
//
//  Created by MacBook on 21/12/21.
//

import Foundation
import Alamofire

struct Repository {
    struct Connectivity {
        static var isConnected: Bool {
            return NetworkReachabilityManager()?.isReachable ?? false
        }
    }
    
//    func appendHeaderParams(to params: Parameters?) -> Parameters {
//        var params = params ?? Parameters()
//        params[HeaderParams.securityKey.rawValue] =  "Admin@@$!"
//        params[HeaderParams.securityPassword.rawValue] = "VM@AZA!VM@AZA!"
//        return params
//    }
    
    func appendHeader() -> Any?{
        var header =  HTTPHeaders()

        if  UserManager().isLogined{
             header[Header.Authorization.rawValue] = "Bearer " + (UserManager().user!.jwtToken)!
            return header
        }
        return nil
    }
    func call(endPoint: String,
              method: HTTPMethod = .post,
              params: Parameters? = nil,
              apipointer: Configuration.whichFolder,
              headers: [String: Any]? = nil,
              success:@escaping (_ response: Any) -> (),
              failure:@escaping (_ response: SystemError) -> ()) {
        var url = ""
        if apipointer == .ACCOUNT{
             url = Repository.URLMaker.apiAccountURLStringFrom(endpoint: endPoint)
        }else if apipointer == .PRODUCT{
             url = Repository.URLMaker.apiProductURLStringFrom(endpoint: endPoint)
        }
        //let headers = RepositoryManager.header(url: URL(string: url), httpMethod: method.rawValue)
        //let params = appendHeaderParams(to: params)
        let headers = appendHeader()
        
        Log.debugPrint("url = \(String(describing: url)) || param = \(String(describing: params)) || Header = \(String(describing: headers))")
        AF.request(url,
                   method: method,
                   parameters: params,
                   encoding: JSONEncoding.default,
                   headers: headers as? HTTPHeaders
                   ) { (urlRequest: inout URLRequest) in
                urlRequest.timeoutInterval = Configuration.isDebug ? 40 : 40
            }
            .validate()
            .responseJSON { (response) in
                processResponse(response: response, success: success, failure: failure)
            }
    }
    
    private func processResponse(response: AFDataResponse<Any>,
                                 success:@escaping (_ response: Any) -> (),
                                 failure:@escaping (_ response: SystemError) -> ()) {
        
        Log.debugPrint(response)
        switch response.result {
        case .failure (let error):
            Log.print(error)

            let urlError = error.underlyingError as? URLError
            //let code = urlError?.errorCode
            let theError = SystemError(error.underlyingError?.localizedDescription ?? error.localizedDescription,
                                       errorCode: urlError?.errorCode ?? 0,
                                       response: response)
            failure(theError)
            
        case .success(let response):
            guard let responseModel = DataManager.parse(data: response, to: Repository.SuccessResponse.self) as? SuccessResponse else {
                let errorCode = -1
                let message = Constants.COMMON_ERROR_MESSAGE
                let theError = SystemError(message,
                                           errorCode: errorCode,
                                           response: response)
                failure(theError)
                return
            }
            
            if responseModel.statusCode != 200 {
                let errorCode = -1 //responseModel.errorCode
                let message = responseModel.msg ?? Constants.COMMON_ERROR_MESSAGE
                let theError = SystemError(message,
                                           errorCode: errorCode,
                                           response: response)
                
                failure(theError)
                return
            }
            
            Log.print(response)
            
            let response = (response as? [String:  Any])? ["data"] ?? "success"
            success(response)
        }
    }
}
