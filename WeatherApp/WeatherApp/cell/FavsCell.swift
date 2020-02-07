//
//  FavsCell.swift
//  WeatherApp
//
//  Created by Pursuit on 2/7/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import ImageKit

class FavsCell: UICollectionViewCell {
    
    public lazy var favImage : UIImageView = {
        let iv = UIImageView()
        
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
        favImageConstraints()
    }
    
    private func favImageConstraints(){
        addSubview(favImage)
              
              favImage.translatesAutoresizingMaskIntoConstraints = false
              
              NSLayoutConstraint.activate([
              // want some padding
                  // with cell constraints there is no need for safe area constraints
                  favImage.topAnchor.constraint(equalTo: topAnchor, constant: 20)
                  // top is postive because we are going down
                  // want some padding because it shouldn't be touching it.. should have some distance
                  ,
                  favImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                  favImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.50),
                  favImage.widthAnchor.constraint(equalTo: favImage.heightAnchor)
              ])
    }

    
    func configureImage(with favPhoto: FavPhoto){

        favImage.image = UIImage(data: favPhoto.imageData)
        
    }

    
}
