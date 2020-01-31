//
//  ViewController.swift
//  WeatherApp
//
//  Created by David Rifkin on 10/8/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class WeatherController: UIViewController {
    
    let WeatherViewInstance = WeatherView()
    
    private var selectedWeather: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Weather App"
        
        //WeatherViewInstance.weatherCollection.dataSource = self
        WeatherViewInstance.weatherCollection.delegate = self
        
        // this is registering the class for the cell... 0
        WeatherViewInstance.weatherCollection.register(UINib(nibName: "WeatherCell", bundle: nil), forCellWithReuseIdentifier: "weatherCell")
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

        cell.backgroundColor = .magenta
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







