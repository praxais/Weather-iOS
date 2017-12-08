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

class HomeViewController: UIViewController, CLLocationManagerDelegate {
    // MARK: Properties
    var presenter: HomeModuleInterface?
    private let locationManager = CLLocationManager()
    
    // MARK: IBOutlets
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    // MARK: VC's Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    private func setup() {
        // all setup should be done here
        getLocation()
        showLoading()
    }
    
    private func getLocation(){
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        presenter?.getWeather(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    }
}

// MARK: HomeViewInterface
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
        tempLabel.text = "\(data.main?.temp ?? 0)"
    }
    
    func showToast(string: String) {
        HUD.flash(.label(string), delay: 1.0)
    }
}
