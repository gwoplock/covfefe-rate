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
        var arr = api.getArray() as! [NSDictionary]
        for obj in arr{
            
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

