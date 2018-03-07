//
//  ViewController.swift
//  covfefeRate
//
//  Created by Garrett Battaglia on 3/7/18.
//  Copyright © 2018 Garrett Battaglia. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {

    let locManger = CLLocationManager()
    @IBOutlet weak var Map: MKMapView!
    var cords: MKCoordinateRegion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//      set up location manager to get user location and zoom
        cords = Map.region
        locManger.delegate = self
        locManger.requestWhenInUseAuthorization()
        locManger.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//  function called when user location changes, locations[0] = current user location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        cords.center = locations[0].coordinate
        self.Map.setRegion(cords, animated: true)
    }

}

