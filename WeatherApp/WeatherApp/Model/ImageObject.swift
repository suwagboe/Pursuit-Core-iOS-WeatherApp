//
//  ImageObject.swift
//  WeatherApp
//
//  Created by Pursuit on 2/6/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation


// encoding image object..
// enccoding a image is different from encoding the photo... 

struct FavPhoto: Codable {
    // it is only the single photo so it should only be one
    // best practice to go from the model itself and then get the objects inside
    
    
    // like a custom model... 
    // making the model in case you want to save more infomation then what is needed...
    let imageData: Data
    let placeName: String
    
    let identifier = UUID().uuidString // gives access to unique identifier

}
