//
//  UserManager.swift
//  VFECommerce
//
//  Created by Renjithnath on 05/08/21.
//

import Foundation

struct UserManager {
    //MARK: - Getters
    static let LOGINED_USER = "LOGINED_USER"
    static let GUEST_MODE = "GUEST_MODE"

    var user: OtpData? = UserManager.getLoginedUser()
    var isLogined = getLoginedUser() != nil
    
    static private func getLoginedUser() -> OtpData? {
        let defaults = UserDefaults.standard
        if let savedPerson = defaults.object(forKey: LOGINED_USER) as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(OtpData.self, from: savedPerson) {
                return loadedPerson
            }
        }
        return nil
    }
    
    static func getIsGuestMode() -> Bool {
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: GUEST_MODE)
    }

    //MARK: - Setters
    static func saveLogined(user: OtpData) {
        do {
            let encoder = JSONEncoder()
            let encoded = try encoder.encode(user)
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: LOGINED_USER)
        } catch let error {
            Log.print(error)
        }
    }
    
    static func setGuestMode() {
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: GUEST_MODE)
    }
    
    static func logout() {
        UserDefaults.standard.removeObject(forKey: LOGINED_USER)
    }
}
