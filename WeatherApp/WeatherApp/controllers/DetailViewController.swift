//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Pursuit on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var heartButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var sunriseLabel: UILabel!
    
    @IBOutlet weak var sunSetLabel: UILabel!
    
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    @IBOutlet weak var inchesOfPercip: UILabel!
    
    @IBOutlet weak var lowLabel: UILabel!
    
    @IBOutlet weak var highLabel: UILabel!
    
    // the data transered should go here
    var selectedDay: ForcastData?
    
    var nameLabel : String?
    
    var actualImageURL : String?
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hids the button
        heartButton.isHidden = true
        
        getLargeImageString(name: nameLabel!)

        //view.backgroundColor I want it to be a red forcast...
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        view.addGestureRecognizer(tap)
        
    }
    
    func persistThePhotoAfterLike(){
      
        guard let image = imageView.image else {
            print("The image isnt there")
            return
        }
        
        if let imageData = image.jpegData(compressionQuality: 0.5) {
        do{
            let favPhoto = FavPhoto(imageData: imageData, placeName: nameLabel!)
            
            try PersistenceHelper.savePhotoTothePersisenceArrayAbove(photo: favPhoto )
        }catch {
            print("this is ithe damn error: \(error)")
        }
        }
    
    }
    
    @objc func doubleTapped() {
        pulsatingAnimationAndScale()
        persistThePhotoAfterLike()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            self.goToFavsController()
        }
        
    }
    
    @IBAction func favsbutton(_ sender: UIButton) {
        //MARK: why when it segues does it not show the tab bar...
        goToFavsController()
        
        //persistThePhotoAfterLike()
        
    }
    
    private func pulsatingAnimationAndScale(){
        heartButton.tintColor = .red
        heartButton.isHidden = false
               UIView.animate(withDuration: 1.5, delay: 0.0, options: [], animations: {
                              self.heartButton.transform = CGAffineTransform(scaleX: 10.0, y: 10.0)
                              self.heartButton.alpha = 0.0
                   }) { (done) in
                       UIView.animate(withDuration: 0.05)
                       {
                           self.heartButton.isHidden = false
                           self.heartButton.layer.cornerRadius = self.heartButton.bounds.size.width / 2.0
                       }
                   }
    }
    
    
    
    private func goToFavsController(){
        
        //segue: UIStoryboardSegue
//        guard let FavsController = segue.source as? FavoritesViewController,
//             let newPhoto = FavsController.event else {
//               fatalError("failed to access CreateEventController")
//           }
        
        
        let favsVC = FavoritesViewController()
        navigationController?.pushViewController(favsVC, animated: true)
    }
    
    private func getLargeImageString(name: String){
        // reassigns the variable to get the image string here...
        PhotosAPIClient.getLargePhotoLink(placeName: name, completion: {
            (result) in
            switch result{
            case .failure(let appError):
                print(appError)
            case .success(let AccessingAllPhotos):
                // get a random photo
                let largeImageURL = AccessingAllPhotos.randomElement()?.largeImageURL
                // largeImageURL = AccessingAllPhotos[1].largeImageURL
                self.actualImageURL = largeImageURL
                self.configreDetailController()
            }
        })
    }
    
    func configreDetailController(){
        guard let info = selectedDay else {
            return
        }
                DispatchQueue.main.async {
                    self.mainLabel.text = "Double tap the image if you love the photo... to make it a fav"
            self.sunSetLabel.text = "The sun set time will be \(info.sunsetTime)"
            self.sunriseLabel.text = " Sunrise time is: \(info.sunsetTime)"
            self.windSpeedLabel.text = "The wind speed is: \(info.windSpeed)"
            self.inchesOfPercip.text = "There will be \(info.precipType ?? "!!!!") inches of rain" //MARK: This one isnt working!!!!!
            self.lowLabel.text = "The low temp is: \(info.temperatureLow)"
            self.highLabel.text = "The high temp for today is: \(info.temperatureHigh?.description ?? "not available")"
            self.imageView.getImage(with: self.actualImageURL ?? "newyork", completion: {
                       [weak self]
                       (result) in
                       switch result {
                       case .failure:
                           DispatchQueue.main.async {
                               // need to reference self because I am inside of the dispatch queue accessing the main break..
                               self?.imageView.image = UIImage(named: "exclamationmark.icloud")
                           }
                       case .success(let image):
                           DispatchQueue.main.async {
                            self?.imageView.image = image
                        }
                       }
                   })
        }
}
    
    
}
