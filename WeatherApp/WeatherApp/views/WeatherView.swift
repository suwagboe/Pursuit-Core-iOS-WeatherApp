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
       // layout.estimatedItemSize = CGSize(width: 100, height: 200)
      //  layout.itemSize = CGSize(width: 400, height: 40)
        
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = .magenta
        return collection
    }()
    
//    public lazy var imageView: UIImageView = {
//       let layout = UIImageView()
//
//        let image = UIImage
//
//
//    }()
    
    public lazy var textField: UITextField = {
        let text = UITextField()
        text.placeholder = "zipcode"
      //  text.placeholderRect(forBounds: CGRect(0)) I want to center the place holder text. 
        text.backgroundColor = .blue
        return text
    }()
    
    public lazy var textFieldLabel: UILabel = {
        
        let label = UILabel()
        
        label.text = "Please enter a zipcode below"
        label.backgroundColor = .green
        
        return label
    }()
    
    public lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "The weather this area is..."
        
        label.textColor = .black
        return label
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
        setUpTextField()
        setUptextFieldLabel()
        setUpWeatherLabel()
    }
    
    private func setUptextFieldLabel() {
        addSubview(textFieldLabel)
        
        textFieldLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textFieldLabel.topAnchor.constraint(equalTo: weatherCollection.bottomAnchor, constant: 20),
            textFieldLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
            
        
        ])
    
    }
    
    private func setUpWeatherLabel(){
        addSubview(weatherLabel)
        
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
                //weatherLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 60),
             //  weatherLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -45)
            weatherLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    private func setUpTextField(){
        
        addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // will this place it 40 down from the top...
            textField.topAnchor.constraint(equalTo: weatherCollection.bottomAnchor, constant: 60),
         //   textField.widthAnchor.constraint(equalTo: widthAnchor, constant: 0.5)
            textField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 100),
            textField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -100),
         //   textField.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 300)
       
        
        ])
    }
    
    private func setUpCollectionView(){
        addSubview(weatherCollection)
        
        weatherCollection.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            weatherCollection.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            weatherCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            weatherCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            weatherCollection.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25)
//            weatherCollection.heightAnchor.constraint(equalTo: heightAnchor, constant: )
           ])
        
        }
    

}


