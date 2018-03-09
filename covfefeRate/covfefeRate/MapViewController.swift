//
//  ViewController.swift
//  covfefeRate
//
//  Created by Garrett Battaglia on 3/7/18.
//  Copyright © 2018 Garrett Battaglia. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,CLLocationManagerDelegate {

    let locManger = CLLocationManager()
    @IBOutlet weak var Map: MKMapView!
    //cordinates for map center
    var cords: MKCoordinateRegion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //assign cords to the map's so the zoom doesn't change
        cords = Map.region
        //set up location manager to get user location and zoom
        locManger.delegate = self
        locManger.requestWhenInUseAuthorization()
        locManger.startUpdatingLocation()
        loadShops()
    }

    func loadShops(){
        let api = APIconnector.init(url:"http://138.197.200.59/api/listCoffee")
        let arr = api.getArray()as! [NSDictionary]
        for obj in arr {
            let name = obj.value(forKey: "name") as! String
            let lat = obj.value(forKey: "lat") as! Double
            let long = obj.value(forKey: "long") as! Double
            let toAdd = CovfefeShopAnnotation(title: name, locationName: name, discipline: "Coffee Shop", coordinate: CLLocationCoordinate2D(latitude: lat, longitude: long))
            Map.addAnnotation(toAdd)
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//  function called when user location changes, locations[0] = current user location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       /* cords.center = locations[0].coordinate
        cords.span = self.Map.region.span
        self.Map.setRegion(cords, animated: true)*/
    }

}

