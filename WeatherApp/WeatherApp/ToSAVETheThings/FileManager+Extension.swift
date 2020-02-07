//
//  FileManager+Extension.swift
//  WeatherApp
//
//  Created by Pursuit on 2/6/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

extension FileManager {
    
    static func getToDocumentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    static func PathToDocumentsDirectorty(with fileName: String) -> URL {
        return getDocumentsDirectory().appendingPathComponent(fileName)
    }
    
}
