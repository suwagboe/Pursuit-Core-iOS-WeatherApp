//
//  ViewController.swift
//  WeatherApp
//
//  Created by David Rifkin on 10/8/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherController: UIViewController {
    
    let weatherViewInstance = WeatherView()
    
    // how to take in the input from the 
    
    private var selectedWeather: WeatherSearch? {
        didSet{
            DispatchQueue.main.async {
                self.weatherViewInstance.weatherCollection.reloadData()
            }
            
        }
    }
    
    var longitudeFromZipcode = "37.8267"
    var latitudeFromZipcode = "-122.4233"
    // need to figure out what the above zipCode is in order to make it the place holder.
    // the stuff the user typed in...
    private var userEnteredText = "" {
        didSet{
            //ToDo: need to guard that they only entered numbers and that it is 4 digits
            weatherViewInstance.weatherCollection.reloadData()
        }
    }
    
    override func loadView() {
        view = weatherViewInstance
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .systemBackground
        navigationItem.title = "Weather App"
        
        weatherViewInstance.textField.delegate = self
        
        //WeatherViewInstance.weatherCollection.dataSource = self
        weatherViewInstance.weatherCollection.delegate = self
        
        // this is registering the class for the cell... 0
        weatherViewInstance.weatherCollection.register(UINib(nibName: "WeatherCell", bundle: nil), forCellWithReuseIdentifier: "weatherCell")
    }
    
    private func convertTheZipcode(_ text: String){
        // this will have to return something.. can you return more than one thing
        // convert the inputed String from the textField into latitude and longitude.
        //???????
        
        ZipCodeHelper.getLatLong(fromZipCode: text, completionHandler: {
            (result) in
            switch result {
            case .failure(let error):
                // here what would the failure be?? a alert for the user??
                break
            case .success(let lat, let long):
                // here I would assign the values
                // MARK: why self here??
                self.longitudeFromZipcode = long.description
                self.latitudeFromZipcode = lat.description
            }
        })
    }
    
    private func loadTheWeather(){
       // using the place holder long and lat from the sample so that way when the app opens it wont be blank
        WeatherAPIClient.getWeatherData(longitude: longitudeFromZipcode, latitude: latitudeFromZipcode, completion: {
            (result) in
            switch result {
            case .failure(let error):
                break
            case .success(let data):
                self.selectedWeather = data
            }
        })
    }


}
extension WeatherController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let enteredText = textField.text else {
            //ToDo: could guard against letters in here
            return false
        }
        //assign userEnteredText
        userEnteredText = enteredText
        textField.resignFirstResponder()
        return true
    }
    
}

extension WeatherController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as? WeatherCell else {
            fatalError("couldn't deque into the other cell..")
        }

        cell.backgroundColor = .yellow
        return cell
    }

}

extension WeatherController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let maxSize: CGSize = UIScreen.main.bounds.size
        
        let itemWidth: CGFloat = maxSize.width * 0.95 // it is 95 percent of the device
        
        return CGSize(width: itemWidth, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
      //  let selectedWeather =
        
        
        
    }
    
    
}







