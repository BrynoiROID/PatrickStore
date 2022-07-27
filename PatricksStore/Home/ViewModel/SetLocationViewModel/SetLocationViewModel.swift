//
//  SetLocationViewModel.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 13/01/22.
//

import Foundation

import Alamofire

class SetLocationViewModel {
    
    var itemsDidChange: ((Any?) -> Void)?
    
    var errorOccured: ((SystemError) -> Void)?
    
    var presentAlert: ((String) -> Void)?
    
    //MARK: - Location Set API Call

    func setLocationAPI(param: LocationSetParams, completion: @escaping () -> ()) {

        let param = LocationSetParams(deviceId: param.deviceId, location: LocationParams(lat: param.location.lat, lng: param.location.lng) )
        
            Repository.RequestingHelper.post(endPoint: Repository.Endpoints.SETLOCATION, parameter: param,apipointer: .ACCOUNT, responseCallBackOf: String.self) { result in
                DispatchQueue.main.async {
                    self.itemsDidChange?(result)
                    completion()
                }
            } failure: { error in
                DispatchQueue.main.async {
                    self.presentAlert?(error.message)
                    completion()
                }
            }
    }
}
