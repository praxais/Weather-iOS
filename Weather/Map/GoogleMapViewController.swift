//
//  GoogleMapViewController.swift
//  Weather
//
//  Created by Prajwal Maharjan on 12/22/17.
//  Copyright © 2017 Prajwal Maharjan. All rights reserved.
//

import UIKit
import GoogleMaps

class GoogleMapViewController: UIViewController {
    public var latitude: Double?
    public var longitude: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a GMSCameraPosition that tells the map to display with given latitude and longitude
        let camera = GMSCameraPosition.camera(withLatitude: latitude ?? Double(), longitude: longitude ?? Double(), zoom: 16.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        self.view.backgroundColor = .white
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude ?? Double(), longitude: longitude ?? Double())
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
    
    override func loadView() {
        
    }
}
