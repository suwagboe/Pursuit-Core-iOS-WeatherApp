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
     
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        return collection
    }()
    
    
//   This is how  Idid it:  https://stackoverflow.com/questions/27919620/how-to-load-gif-image-in-swift
    public lazy var imageView: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage.gifImageWithName("weather gif")
               iv.contentMode = .scaleAspectFill
               iv.backgroundColor = .blue // just to test it...
        return iv
    }()

    
    public lazy var viewHazyLayer: UIView = {
         let iv = UIView()
        iv.backgroundColor = .black
        iv.alpha = 0.3
                 
          return iv
      }()
    
    public lazy var textField: UITextField = {
        let text = UITextField()
        text.placeholder = "zipcode"
        text.backgroundColor = .systemGray
        text.textColor = .white
        text.keyboardType = .numbersAndPunctuation
        return text
    }()
    
    public lazy var textFieldLabel: UILabel = {
        
        let label = UILabel()
        
        label.text = "Please enter a zipcode below"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .white
        
        return label
    }()
    
    public lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "The weather this area is..."
        label.font = UIFont.preferredFont(forTextStyle: .headline)

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
        // TOP ONE IS WHAT CONSTRAINT FIRST
        setUpNewsImageViewConstraints()
        setUpviewHazyLayerConstraints()
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
        
            weatherLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    private func setUpTextField(){
        
        addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // will this place it 40 down from the top...
            textField.topAnchor.constraint(equalTo: weatherCollection.bottomAnchor, constant: 60),
            textField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 100),
            textField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -100),
        ])
    }
    
    private func setUpCollectionView(){
        addSubview(weatherCollection)
        
        weatherCollection.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            weatherCollection.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            weatherCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            weatherCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            weatherCollection.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.20)
           ])
        }
    
    private func setUpNewsImageViewConstraints(){
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        // want some padding
            // with cell constraints there is no need for safe area constraints
            imageView.topAnchor.constraint(equalTo: topAnchor)
            // top is postive because we are going down
            // want some padding because it shouldn't be touching it.. should have some distance
            ,
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setUpviewHazyLayerConstraints(){
        addSubview(viewHazyLayer)
        
        viewHazyLayer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        // want some padding
            // with cell constraints there is no need for safe area constraints
            viewHazyLayer.topAnchor.constraint(equalTo: topAnchor)
            // top is postive because we are going down
            // want some padding because it shouldn't be touching it.. should have some distance
            ,
            viewHazyLayer.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewHazyLayer.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewHazyLayer.bottomAnchor.constraint(equalTo: bottomAnchor)
           // imageView.heightAnchor.constraint(equalTo: heightAnchor),
           // imageView.widthAnchor.constraint(equalTo: newsImageView.heightAnchor)
        ])
    }

}


