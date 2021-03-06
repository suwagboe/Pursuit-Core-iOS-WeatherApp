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
    private static var persistedImages = [FavPhoto]()
    
    //the place it should be stored...
    static let fileName = "images.plist"
    // CRUD method
    //MARK: why are things marked private static func again??
    private static func saveHeartedImage() throws{
        // we are only saving it because someone has heart it...
        
        let url = FileManager.PathToDocumentsDirectorty(with: fileName)
        
        do{
            let data = try PropertyListEncoder().encode(persistedImages)
            try data.write(to: url, options: .atomic)
        }catch {
            throw DataPersistenceError.savingError(error)
        }
    }
    
    static func savePhotoTothePersisenceArrayAbove(photo: FavPhoto) throws{
        
        // before using the persistedImages arrays we first make sure that we are using the most updated saved data
        _ = try loadPersistedPhotos() // this is the try that would fail should the else below still be used.
        persistedImages.append(photo)
        do{
            try saveHeartedImage()
        }catch{
            throw DataPersistenceError.savingError(error)
        }
        
    }
    
    static func loadPersistedPhotos() throws -> [FavPhoto]{
        let url = FileManager.PathToDocumentsDirectorty(with: fileName)
        if FileManager.default.fileExists(atPath: url.path){
            if let data = FileManager.default.contents(atPath: url.path){
                do {
                    persistedImages = try PropertyListDecoder().decode([FavPhoto].self, from: data)
                } catch {
                    throw DataPersistenceError.decodingError(error)
                }
               
            }  else {
            throw DataPersistenceError.noData
            }
        }
//        else { because this will automatically throw an error in the beginning we do not want to the else, because when the app first loads there shouldnt be any photos do the file would not exist and it would cause the try from above to fail as well
//            throw DataPersistenceError.fileDoesNotExist(fileName)
//        }
        return persistedImages
    }

}
