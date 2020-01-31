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
//
//extension WeatherController: UICollectionViewDataSource {
//
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 50
//    }
//
//
//     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        guard let cell = collectionView.dequeReusableCell(withReuseIdentifier: "weatherCell", for: indexPath)
////            as? WeatherCell else {
////            fatalError("couldn't deque into the other cell..")
////        }
//
//        cell.backgroundColor = .magenta
//        return cell
//    }
//
//
//}

extension WeatherController: UICollectionViewDelegate {
    
}
