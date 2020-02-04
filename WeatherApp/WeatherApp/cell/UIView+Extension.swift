//
//  UIView+Extension.swift
//  WeatherApp
//
//  Created by Pursuit on 2/3/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor, leading: NSLayoutXAxisAnchor, bottom: NSLayoutYAxisAnchor, trailing: NSLayoutXAxisAnchor, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        
        leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        
        bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding.right).isActive = true
        
    }
}
