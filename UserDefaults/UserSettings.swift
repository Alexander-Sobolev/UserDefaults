//
//  UserSettings.swift
//  UserDefaults
//
//  Created by Alexander Sobolev on 26.02.2021.
//

import Foundation

class UserSettings {
    
    private enum SettingsKeys: String {
        case userName
    }
    
    static var userName: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.userName.rawValue)
        } set {
            
            let defaults = UserDefaults.standard
            let key = SettingsKeys.userName.rawValue
            if let name = newValue {
                print("value: \(name) was added to key \(key)")
                defaults.setValue(name, forKey: key)
                    
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
}
