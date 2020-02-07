//
//  UserPreferencecs.swift
//  WeatherApp
//
//  Created by Pursuit on 2/7/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

enum userSettingsKey {
    // only needed one key for saved 
    static let defaultZipcode = "Zipcode"
}


class UserSettings {
    
    // singleton
    private init() {}
    
        static let shared = UserSettings()
    
    func saveZipcode(with zipCode: String) {
        
UserDefaults.standard.set(zipCode, forKey: userSettingsKey.defaultZipcode)
    }
     
    // I dont need an enum because I made the variable in the function that should be blank
//
//    func retrieveSaves() -> String? {
//
//        guard let theString = UserDefaults.standard.object(forKey: userSettingsKey.defaultZipcode) as? String else {
//            return nil
//        }
//        return theString
//    }
    
    func retrieveSavedZipcode() -> String? {
        
        guard let getZipcode = UserDefaults.standard.object(forKey: userSettingsKey.defaultZipcode) as? String else {
            return nil
        }
        return getZipcode
    }
    
}
