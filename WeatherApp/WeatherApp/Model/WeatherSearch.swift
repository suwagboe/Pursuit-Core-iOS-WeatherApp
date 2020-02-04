//
//  WeatherSearch.swift
//  WeatherApp
//
//  Created by Pursuit on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct WeatherSearch: Codable {
    let latitude: String
    let longitude: String
    let timeZone: String
    let daily: [Daily]
    
}

struct Daily: Codable {
    let icon: String
    let data: [Data]
}

struct Data: Codable {
    let Summary: String
    let temperatureHigh: Double
    let temperatureLow: Double
}
