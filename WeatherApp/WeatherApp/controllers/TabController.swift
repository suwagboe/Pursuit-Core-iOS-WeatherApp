//
//  TabController.swift
//  WeatherApp
//
//  Created by Pursuit on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class TabController: UITabBarController {
    
    private lazy var wc: WeatherController = {
        let controller = WeatherController()
        controller.tabBarItem = UITabBarItem(title: "Whats the weather", image: UIImage(systemName: "cloud.sun.fill"), tag: 0)
        return controller
        
    }()
    
    private lazy var fc: FavoritesViewController = {
       let controller = FavoritesViewController()
        controller.tabBarItem = UITabBarItem(title: "yo favs", image: UIImage(systemName: "heart.circle"), tag: 1)
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [UINavigationController(rootViewController: wc), fc]
        
    }
 
    
    
    
}
