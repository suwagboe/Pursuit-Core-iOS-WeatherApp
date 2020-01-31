//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Pursuit on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class WeatherView: UIView {
// set up the variables
    public lazy var weatherCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 400, height: 400)
        
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = .blue
        return collection
    }()
    
    override init(frame: CGRect){
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        setUpCollectionView()
    }
    
    private func setUpCollectionView(){
        addSubview(weatherCollection)
        
        weatherCollection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weatherCollection.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            weatherCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            weatherCollection.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            weatherCollection.trailingAnchor.constraint(equalTo: trailingAnchor)
        
        ])
        
        
        
    }
    

}

