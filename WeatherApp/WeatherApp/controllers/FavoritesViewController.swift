//
//  FavoritesViewController.swift
//  WeatherApp
//
//  Created by Pursuit on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    private let favsViewInstance = FavsView()
    
    private var theSavedPhotos = [APhoto](){
        didSet{
            favsViewInstance.fCollection.reloadData()
        }
    }
    
    override func loadView() {
        view = favsViewInstance
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadPersistedStuff()
        favsViewInstance.fCollection.delegate = self
        favsViewInstance.fCollection.dataSource = self
        view.backgroundColor = .yellow
        
    favsViewInstance.fCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "fCell")
    }
    
    private func loadPersistedStuff(){
        
        do {
            try theSavedPhotos = PersistenceHelper.loadPersistedPhotos()
        } catch {
            print("errors: \(error)")
        }
    }
    
    
    
}

extension FavoritesViewController: UICollectionViewDataSource{
    
    // amount of cell
    // what is the cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fCell", for: indexPath)
        
        
        
        cell.backgroundColor = .blue
        return cell
    }
    
}

extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let maxSize: CGSize = UIScreen.main.bounds.size
        
        let itemWidth: CGFloat = maxSize.width
        let itemheight: CGFloat = maxSize.height * 0.2
        
        return CGSize(width: itemWidth, height: itemheight)
    }
}
