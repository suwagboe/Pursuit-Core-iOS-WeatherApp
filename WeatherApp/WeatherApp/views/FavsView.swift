//
//  FavsView.swift
//  WeatherApp
//
//  Created by Pursuit on 2/6/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class FavsView: UIView {

    // colletion view of the images.
    public lazy var fCollection: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
       // collection.backgroundColor = UIImage.gif(name: "weather gif")
        //collection.backgroundView = UIImage.gif(name: "weather gif")
        
        return collection
    }()
    
    public lazy var imageView: UIImageView = {
         let iv = UIImageView()
          iv.image = UIImage.gif(name: "weather gif")
                 iv.contentMode = .scaleAspectFill
                 iv.backgroundColor = .blue // just to test it...
          return iv
      }()
    
        override init(frame: CGRect) {
            super.init(frame: UIScreen.main.bounds)
            commonInit()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            commonInit()
        }
        
        private func commonInit() {
          //  setUpNewsImageViewConstraints()
            setUpFCollection()
            
        }
    
    private func setUpFCollection(){
        addSubview(fCollection)
        
        fCollection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fCollection.topAnchor.constraint(equalTo: topAnchor),
            fCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            fCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            fCollection.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
 
    
    

}
