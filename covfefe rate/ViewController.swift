//
//  ViewController.swift
//  covfefe rate
//
//  Created by Garrett Battaglia on 2/9/18.
//  Copyright © 2018 Garrett Battaglia. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var Map: MKMapView!
    let LocMgr = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LocMgr.delegate = self
        LocMgr.requestWhenInUseAuthorization()
        LocMgr.startUpdatingLocation()
        
        let test = CovfefeShop(title: "King David Kalakaua",locationName: "Waikiki Gateway Park",discipline: "Sculpture", coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0) )
        Map.addAnnotation(test)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        Map.setRegion(coordinateRegion, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        centerMapOnLocation(location: locations[0])
    }
}

