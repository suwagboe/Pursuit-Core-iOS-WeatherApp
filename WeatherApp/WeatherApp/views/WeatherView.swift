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
    public lazy var weatherColletion: UICollectionView = {
        let collection = UICollectionView()
        
        return collection
    }()
    
    override init(frame: CGRect){
        super.init(frame: UIScreen.main.bounds)
        
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        
    }
    
    private func commonInit(){
        
    }
    
    private func setUpCollectionView(){
        addSubview(weatherColletion)
        
        weatherColletion.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        //    weatherColletion.topAnchor = 
        
        ])
        
        
        
    }
    

}

