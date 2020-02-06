//
//  PhotosAPIClient.swift
//  WeatherApp
//
//  Created by Pursuit on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation
import NetworkHelper

struct PhotosAPIClient {
    
    static func getLargePhotoLink(placeName: String, completion: @escaping (Result< [APhoto], AppError>)->()){
        let enpointURL = "https://pixabay.com/api/?key=14936493-906bcb5446b6ffd582095b08b&qnewYork&image_type=photo&pretty=true"
        //"https://pixabay.com/api/?key=14936493-14936493-906bcb5446b6ffd582095b08b&q=\( placeName))&image_type=photo&pretty=true
        guard let url = URL(string: enpointURL) else {
            completion(.failure(.badURL(enpointURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) {
            
            (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do{
//                    let result = try JSONDecoder().decode([AllPhotos].self, from: data)
//                    completion(.success(result)) // this cant work because you have to go from top to bottom inside to outside when working with the model
                     let result = try JSONDecoder().decode(AllPhotos.self, from: data)
                   completion(.success(result.hits))

                    // need access to photos to go into hits
                    // but why cant I just go into all
                } catch{
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        
    }
    
    
}
