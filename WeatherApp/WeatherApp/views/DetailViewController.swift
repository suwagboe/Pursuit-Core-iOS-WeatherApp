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
    override func viewDidLoad() {
        super.viewDidLoad()
configreDetailController()
        //view.backgroundColor I want it to be a red forcast...
    }
    
    func configreDetailController(){
        
        guard let info = selectedDay else {
            return
        }
        
     //   mainLabel.text = nameLabel
        sunriseLabel.text = " Sunrise time is: \(info.sunsetTime)"
        windSpeedLabel.text = "The wind speed is: \(info.windSpeed)"
        inchesOfPercip.text = "There will be \(info.precipType?.description ?? "0") inches of rain"
        lowLabel.text = "The low temp is: \(info.temperatureLow)"
        highLabel.text = "The high temp for today is: \(info.temperatureHigh?.description ?? "not available")"
        
        imageView.getImage(with: nameLabel ?? "newyork", completion: {
            [weak self]
            (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    // need to reference self because I am inside of the dispatch queue accessing the main break..
                    self!.imageView.image = UIImage(named: "exclamationmark-triangle")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self!.imageView.image = image
                }
            }
        })
    
}
    
    
}
