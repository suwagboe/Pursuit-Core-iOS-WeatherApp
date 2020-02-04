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
        collection.backgroundColor = .magenta
        return collection
    }()
    
    public lazy var textField: UITextField = {
        let text = UITextField()
        text.placeholder = "please input a zipcode here"
        text.backgroundColor = .blue
        return text
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
    }
    private func setUpTextField(){
        
        addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // will this place it 40 down from the top...
            textField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -600 ),
         //   textField.widthAnchor.constraint(equalTo: widthAnchor, constant: 0.5)
            textField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 100),
            textField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -100),
         //   textField.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 300)
       
        
        ])
    }
    
    private func setUpCollectionView(){
        addSubview(weatherCollection)
        
        weatherCollection.translatesAutoresizingMaskIntoConstraints = false
        
        //weatherCollection.anchor(top: weatherCollection.safeAreaLayoutGuide.topAnchor, leading: weatherCollection.safeAreaLayoutGuide.leadingAnchor, bottom: weatherCollection.safeAreaLayoutGuide.bottomAnchor, trailing: weatherCollection.safeAreaLayoutGuide.trailingAnchor)
        
        NSLayoutConstraint.activate([
            weatherCollection.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            weatherCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            weatherCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            weatherCollection.heightAnchor.constraint(equalTo: heightAnchor, constant: -750)
           ])
        
        }
    

}


