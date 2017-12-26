//
//  HomeViewController.swift
//  Weather
//
//  Created by Prajwal Maharjan on 12/4/17.
//Copyright © 2017 Prajwal Maharjan. All rights reserved.
//

import UIKit
import PKHUD
import CoreLocation
import GooglePlaces

class HomeViewController: UIViewController {
    var presenter: HomeModuleInterface?
    private let locationManager = CLLocationManager()
    private var weatherList = [ListModel]()
    private var latitude: Double? = nil
    private var longitude: Double? = nil
    private var markerTitle: String? = nil
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    private func setup() {
        addNavigationBarItems()
        getLocation()
        showLoading()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width/3 - 10, height: 94)
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
        flowLayout.scrollDirection = UICollectionViewScrollDirection.horizontal
        flowLayout.minimumInteritemSpacing = 0.0
        collectionView.collectionViewLayout = flowLayout
        
        //add cityLabel tap listener
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapFunction))
        cityLabel.isUserInteractionEnabled = true
        cityLabel.addGestureRecognizer(tap)
        
        //add search tab listener
        let tempTap = UITapGestureRecognizer(target: self, action: #selector(self.tempClicked))
        tempLabel.isUserInteractionEnabled = true
        tempLabel.addGestureRecognizer(tempTap)
    }
    
    private func addNavigationBarItems(){
        let add = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(addClicked(sender:)))
        let facebook = UIBarButtonItem(title: "Login", style: .done, target: self, action: #selector(facebookClicked(sender:)))
        navigationItem.rightBarButtonItems = [add, facebook]
    }
    
    private func getLocation(){
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    @objc private func addClicked(sender: UIBarButtonItem){
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
    }
    
    @objc private func facebookClicked(sender: UIBarButtonItem){
        let facebookViewController = FacebookViewController()
        facebookViewController.view.backgroundColor = .white
        navigationController?.pushViewController(facebookViewController, animated: true)
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        //open Google Map Screen
        let mapViewController = GoogleMapViewController()
        mapViewController.latitude = latitude
        mapViewController.longitude = longitude
        mapViewController.markerTitle = markerTitle
        navigationController?.pushViewController(mapViewController, animated: true)
    }
    
    @objc func tempClicked(sender:UITapGestureRecognizer) {
        // create the alert
        let alert = UIAlertController(title: nil, message: "This is my message.", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Third", style: .default, handler: { action in
            print("Third clicked")
        }))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}

extension HomeViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        self.latitude = location.coordinate.latitude
        self.longitude = location.coordinate.longitude
        presenter?.getWeather(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    }
}

extension HomeViewController: GMSAutocompleteViewControllerDelegate {
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        presenter?.getWeather(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
        print("Latitude: \(place.coordinate.latitude) \nLongitude: \(place.coordinate.longitude)")
        self.latitude = place.coordinate.latitude
        self.longitude = place.coordinate.longitude
        self.markerTitle = place.name
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error: \(error.localizedDescription)")
        showToast(string: error.localizedDescription)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as! HomeCollectionViewCell
        
        let weatherForcast = weatherList[indexPath.row]
        let temp = (weatherForcast.main?.temp ?? 0) - 273.15
        cell.textTemp?.text = "\(String(format: "%.1f", temp))°C"
        cell.textWeather?.text = weatherForcast.weather![0].main
        let date = weatherForcast.date
        cell.textDay?.text = date.components(separatedBy: " ").first
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension HomeViewController: HomeViewInterface {
    func showLoading() {
        HUD.show(.systemActivity, onView: self.view)
    }
    
    func hideLoading() {
        HUD.hide()
    }
    
    func populateData(data: Weather) {
        cityLabel.text = data.name
        weatherLabel.text = data.weather![0].main
        let temp = (data.main?.temp ?? 0) - 273.15
        tempLabel.text = "\(String(format: "%.1f", temp))°C"
        locationManager.stopUpdatingLocation()
        markerTitle = data.name
    }
    
    func populateForcastData(forcastList: [ListModel]) {
        self.weatherList = forcastList
        self.collectionView.reloadData()
    }
    
    func showToast(string: String) {
        HUD.flash(.label(string), delay: 1.0)
    }
}
