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
        iv.image = UIImage(systemName: "")
        
        return iv
    }()
    
    
//    func configureImage(with image: String){
//
//        favImage.getImage(with: image){ [weak self]
//            result in
//            switch result {
//            case .failure:
//                DispatchQueue().main.async {
//                    favImage.image = UIImage(named: "")
//                }
//            case .success(let image):
//                DispatchQueue.main.async {
//                    favImage.image = UIImage(named: image)
//                }
//            }
//        } 
//    }
    
    
}
