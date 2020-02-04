//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Pursuit on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import ImageKit

class WeatherCell: UICollectionViewCell {
    
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var weatherHighLabel: UILabel!
    
    @IBOutlet weak var weatherLowLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
   public func configureCell(with weatherInfo: ForcastData){
        
        //   let theData = weatherInfo.daily.first?.data
        
        //MARK: what should the date be...
       // dateLabel.text = weatherInfo.daily.first.
   
        
    weatherHighLabel.text = "High: \(weatherInfo.temperatureLow )"
    weatherLowLabel.text = "Low: \(weatherInfo.temperatureLow )"
        
        
        weatherImageView.getImage(with: "") { [weak self]
            (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self!.weatherImageView.image = UIImage(named: "exclamationmark-triangle")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.weatherImageView.image = image
                }
            }
        }
        
    }
    
}
