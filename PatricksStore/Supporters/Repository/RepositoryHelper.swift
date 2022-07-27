//
//  RepositoryHelper.swift
//  Ryon
//
//  Created by Renjithnath on 02/03/21.
//

import Foundation

extension Repository {
    struct RequestingHelper {
        static func post<T: Decodable>(
            endPoint: String,
            parameter data: Encodable? = nil,
            apipointer: Configuration.whichFolder,
            responseCallBackOf type: T.Type,
            success: @escaping (T) -> (),
            failure: @escaping (SystemError) -> ()
        ) {
            let params = data?.dictionary
            Repository().call(endPoint: endPoint,
                                   method: .post,
                                   params: params,apipointer: apipointer) { (response) in
                processSuccessResponse(response, responseCallBackOf: type, success: success, failure: failure)
            } failure: { serviceError in
                failure(serviceError)
            }

        }
        
        private static func processSuccessResponse<T: Decodable>(
            _ response: Any,
            responseCallBackOf type: T.Type,
            success: @escaping (T) -> (),
            failure: @escaping (SystemError) -> ()
        ) {
            if let response = response as? String {
                success(response as! T)
                return
            } else {
                
                do {
                    if let jsonData = try? JSONSerialization.data(withJSONObject: response) {
                        let decoder = JSONDecoder()
                        //decoder.keyDecodingStrategy = .convertFromSnakeCase
                        success(try decoder.decode(type, from: jsonData))
                        return
                    }
                } catch let err {
                    Log.debugPrint(Constants.PARSING_ERROR_MESSAGE, err)
                    if Configuration.isDebug {
                        failure(SystemError(Constants.PARSING_ERROR_MESSAGE,
                                            errorCode: Repository.ErrorCode.parsingError.rawValue,
                                            response: response)
                        )
                        return
                    }
                }
            }
            
            failure(SystemError(Constants.COMMON_ERROR_MESSAGE,
                                errorCode: Repository.ErrorCode.parsingError.rawValue,
                                     response: response)
            )
        }
    }
}
