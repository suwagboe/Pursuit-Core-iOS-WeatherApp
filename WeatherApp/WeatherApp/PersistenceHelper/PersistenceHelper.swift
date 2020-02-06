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
    // so I am persisting the IMAGES
    
    // MARK: first question about persisting...
    // should this be for the main level or the level under  it.
    // like is it based on what we wanna persist or it is best to make it that everything is being persisted...
    private static var weather = [Daily]()
    
    //the place it should be stored...
    static let fileName = "weather.plist"
    
    // CRUD method
    
    //MARK: why are things marked private static func again??
   // private static func saveItem
    
    
    
}
