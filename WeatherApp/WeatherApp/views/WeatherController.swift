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
    
    private var listOfWeatherInfo = [ForcastData]() {
        // this holds the the all the days in the weatherClient...
        didSet{
            DispatchQueue.main.async {
                self.weatherViewInstance.weatherCollection.reloadData()
            }
            
        }
    }
    
    // need to figure out what the above zipCode is in order to make it the place holder.
    // the stuff the user typed in...
    private var userEnteredText = "" {
        didSet{
            //ToDo: need to guard that they only entered numbers and that it is 4 digits
            // should I can the function here instead?
            // this should call the convertZipcode function because you need add the entered zipcode into the zipcode.. so once it has a value that function should get called.
            getTheZipcode(userEnteredText)
        }
    }
    
    public var placeNamed: String?
    
    override func loadView() {
        view = weatherViewInstance
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userEnteredText = "10474"

        //view.backgroundColor = .systemBackground
        navigationItem.title = "Weather App"
        
        weatherViewInstance.textField.delegate = self
                
        //WeatherViewInstance.weatherCollection.dataSource = self
        weatherViewInstance.weatherCollection.delegate = self
        weatherViewInstance.weatherCollection.dataSource = self
        
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
                print(error)
                // here what would the failure be?? a alert for the user??
//                DispatchQueue.main.async {
//                         UIAlertAction(title: "zipcod Error", style: .default, handler: )
//                }
            case .success(let Cooridnates):
                // here I would assign the values
                // MARK: why self here??
                self.loadTheWeather(lat: Cooridnates.lat, long: Cooridnates.long)
              //  self.placeNamed = Cooridnates.pla
               // self.placeNamed = Cooridnates.placeName
              //  self.longitudeFromZipcode = long.description
                //self.latitudeFromZipcode = lat.description
            }
        })
    }
    
    private func getTheZipcode(_ text: String) {
        ZipCodeHelper.getLatLongName(fromZipCode: text, completionHandler: {
            (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let coordinates):
                self.loadTheWeather(lat: coordinates.lat, long: coordinates.long)
                self.placeNamed = coordinates.placeName
            }
        })
    }
    
    private func loadTheWeather(lat: Double, long: Double){
       // using the place holder long and lat from the sample so that way when the app opens it wont be blank
        WeatherAPIClient.getWeatherData(latitude: lat, longitude: long, completion: {
            (result) in
            switch result {
            case .failure(let error):
                print("\(error)")
            case .success(let data):
                self.listOfWeatherInfo = data.daily.data
                dump(data)
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
        //selectedWeather.count
        //MARK: is my model right??
        return listOfWeatherInfo.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as? WeatherCell else {
            fatalError("couldn't deque into the other cell..")
        }
        
        weatherViewInstance.weatherLabel.text = "The forcast for \(0) is below"
          //weatherViewInstance.textFieldLabel.text = "The forcast for \(0) is below"
        
        let selectday = listOfWeatherInfo[indexPath.row]
        // ToDo: a configureCell() function that can be called here an apply everything
        cell.configureCell(with: selectday)
//        cell.backgroundColor = .yellow
        return cell
    }

}

extension WeatherController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let maxSize: CGSize = UIScreen.main.bounds.size
        
        let itemWidth: CGFloat = maxSize.width * 0.95 // it is 95 percent of the device
        
        return CGSize(width: itemWidth, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // function to transfer the data from the one that was selected... from this controller to the next one...
        
        let selectedWeather = listOfWeatherInfo[indexPath.row]
        
        let dvcontroller = UIStoryboard(name: "", bundle: nil)
        
        guard let dvc = dvcontroller.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else {
            fatalError("couldnt access the dvcontroller")
        }
        
         dvc.selectedDay = selectedWeather
        
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    
}
