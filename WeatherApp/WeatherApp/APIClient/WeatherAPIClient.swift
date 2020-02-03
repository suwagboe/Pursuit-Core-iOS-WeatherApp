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
    static func getWeatherData(completion: @escaping (Result<WeatherSearch, AppError>) -> ()){
        let endpointURL = ""
        
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
                    let result = try JSONDecoder().decode(WeatherSearch.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
             
            }
        }
    
}

}
