//
//  PersistenceHelper.swift
//  WeatherApp
//
//  Created by Pursuit on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

enum DataPersistenceError: Error { // conforming to the Error protocol
    case savingError(Error) // associated value
    case fileDoesNotExist(String) // anything you wanna capture you use an associated value for it
    case noData
    case decodingError(Error)
    case deletingError(Error)
}

class PersistenceHelper {
    
    private static var weather = [WeatherModel]()
    
    //the place it should be stored...
    static let fileName = "weather.plist"
    
    
    
}
