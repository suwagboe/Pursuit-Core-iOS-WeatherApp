//
//  AppError.swift
//  WeatherApp
//
//  Created by Pursuit on 2/1/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

public enum AppError: Error {
     case badURL(String)
     case noResponse
     case networkClientError(Error)
     case noData
     case decodingError(Error)
     case encodingError(Error)
     case badStatusCode(Int)
     case badMimeType(String)
}
