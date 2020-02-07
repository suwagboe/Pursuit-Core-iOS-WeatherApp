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
    
    public var theSavedPhotos = [FavPhoto](){
        didSet{
            favsViewInstance.fCollection.reloadData()
        }
    }
    
    override func loadView() {
        view = favsViewInstance
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        favsViewInstance.fCollection.delegate = self
        favsViewInstance.fCollection.dataSource = self
        view.backgroundColor = .yellow
        
        favsViewInstance.fCollection.register(FavsCell.self, forCellWithReuseIdentifier: "favCell")
//    favsViewInstance.fCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "favCell")
       // favsViewInstance.fCollection.register(UINib(nibName: "favCell", bundle: nil), forCellWithReuseIdentifier: "favCell")
        
          
        loadPersistedStuff()

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
        return theSavedPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cell =  favsViewInstance.fCollection.dequeueReusableCell(withReuseIdentifier: "favCell", for: indexPath) as? FavsCell else {
            fatalError("couldnt downcast")
        }
        
        // puts a image inside of the cell
//        let imageView:UIImageView=UIImageView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))

//        // data into image

//        // need to access single photo
//        let photo = theSavedPhotos[indexPath.row]

//        // assign the image with the above photo
//        let img : UIImage = UIImage(data: photo.image)!

//        // assigns the imageView to the image.
//        imageView.image = img
//      cell.contentView.addSubview(imageView)
        
               let photo = theSavedPhotos[indexPath.row]
              //  let img : UIImage = UIImage(data: photo.image)!
        //FavsCell.imageView.image = img

        cell.configureImage(with: photo)
    
        cell.backgroundColor = .blue
        return cell
    }
    
}

extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let maxSize: CGSize = UIScreen.main.bounds.size
        
        let itemWidth: CGFloat = maxSize.width
        let itemheight: CGFloat = maxSize.height * 0.3
        
        return CGSize(width: itemWidth, height: itemheight)
    }
}
