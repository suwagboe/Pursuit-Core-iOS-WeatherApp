//
//  WeatherAPIClient.swift
//  WeatherApp
//
//  Created by Pursuit on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation
import NetworkHelper

struct WeatherAPIClient{
    static func getWeatherData(latitude: Double,longitude: Double,completion: @escaping (Result<WeatherModel, AppError>) -> ()){
        let endpointURL  = "https://api.darksky.net/forecast/5d15deeb79b991c4303c8146faa47821/\(latitude),\(longitude)"

        
        guard let url = URL(string: endpointURL) else {
            completion(.failure(.badURL(endpointURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) {
            (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    //MARK: TODO: I need a do catch here because the code wouldnt let me do it otherwise but I dont really understand WHY?
                    // when something is thrown it has to be caught.. the data is being thrown. 
                    // still need to access the lat and longitude
                    let result = try JSONDecoder().decode(WeatherModel.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
             
            }
        }
    
}

}
