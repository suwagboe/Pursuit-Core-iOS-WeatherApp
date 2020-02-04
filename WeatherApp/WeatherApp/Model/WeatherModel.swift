//
//  WeatherSearch.swift
//  WeatherApp
//
//  Created by Pursuit on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct WeatherModel: Codable {
    let latitude: Double
    let longitude: Double
   // let timeZone: String
    let daily: Daily // this is a dictionary
    
}

struct Daily: Codable {
    let icon: String
    let data: [ForcastData]
}

struct ForcastData: Codable {
    let summary: String
    let time: Int
    let sunriseTime: Int
    let sunsetTime: Int
    let icon: String
    let windSpeed: Double
    let precipType: String?
    let temperatureHigh: Double?
    let temperatureLow: Double
    

}
