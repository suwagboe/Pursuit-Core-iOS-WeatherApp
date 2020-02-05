//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Pursuit on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var sunriseLabel: UILabel!
    
    @IBOutlet weak var sunSetLabel: UILabel!
    
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    @IBOutlet weak var inchesOfPercip: UILabel!
    
    @IBOutlet weak var lowLabel: UILabel!
    
    @IBOutlet weak var highLabel: UILabel!
    
    // the data transered should go here
    var selectedDay: ForcastData?
    
    var nameLabel : String?
    
    var actualImageURL : String?
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getLargeImageString(name: nameLabel!)

        //getLargeImageString(name: nameLabel!)
        //view.backgroundColor I want it to be a red forcast...
    }
    
    private func getLargeImageString(name: String){
        // reassigns the variable to get the image string here...
        
        PhotosAPIClient.getLargePhotoLink(placeName: name, completion: {
            (result) in
            switch result{
            case .failure(let appError):
                print(appError)
            case .success(let AccessingAllPhotos):
                let largeImageURL = AccessingAllPhotos[0].largeImageURL
                self.actualImageURL = largeImageURL
                self.configreDetailController()
            }
        })
        
    }
    
    
    func configreDetailController(){
        
        guard let info = selectedDay else {
            return
        }
        
     //   mainLabel.text = nameLabel
        DispatchQueue.main.async {
            self.sunSetLabel.text = "The sun set time will be \(info.sunsetTime)"
            self.sunriseLabel.text = " Sunrise time is: \(info.sunsetTime)"
            self.windSpeedLabel.text = "The wind speed is: \(info.windSpeed)"
            self.inchesOfPercip.text = "There will be \(info.precipType ?? "!!!!") inches of rain" //MARK: This one isnt working!!!!!
            self.lowLabel.text = "The low temp is: \(info.temperatureLow)"
            self.highLabel.text = "The high temp for today is: \(info.temperatureHigh?.description ?? "not available")"
                   
                   
                   
            self.imageView.getImage(with: self.actualImageURL ?? "newyork", completion: {
                       [weak self]
                       (result) in
                       switch result {
                       case .failure:
                           DispatchQueue.main.async {
                               // need to reference self because I am inside of the dispatch queue accessing the main break..
                               self?.imageView.image = UIImage(named: "exclamationmark.icloud")
                           }
                       case .success(let image):
                           DispatchQueue.main.async {
                               self?.imageView.image = image
                           }
                       }
                   })
        }
       
    
}
    
    
}
