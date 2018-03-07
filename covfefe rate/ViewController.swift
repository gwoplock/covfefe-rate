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
        
        let todoEndpoint: String = "http://138.197.200.59/api/listCoffee"
        guard let url = URL(string: todoEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET on /todos/1")
                print(error!)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            // parse the result as JSON, since that's what the API provides
            do {
               /* if let array = data as? NSArray{
                    for obj in array{
                        if let dict = obj as? NSDictionary{
                            print("name:" +  dict[obj] )
                        }
                    }
                }*/
                if let array = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? NSArray{
                    for obj in array{
                        if let dict = obj as? NSDictionary{
                            print("name:" + (dict.value(forKey: "name") as! String) )
                            let toAdd = CovfefeShop(title: (dict.value(forKey: "name") as! String),locationName: (dict.value(forKey: "name") as! String),discipline: "coffee shop", coordinate: CLLocationCoordinate2D(latitude: (dict.value(forKey: "lat") as! Double), longitude: (dict.value(forKey: "long") as! Double)) )
                            
                            self.Map.addAnnotation(toAdd)

                        }
                    }

                }
                // now we have the todo
                // let's just print it to prove we can access it
                //print("The todo is: " + todo.description)
                
                // the todo object is a dictionary
                // so we just access the title using the "title" key
                // so check for a title and print it if we have one
                /*guard let todoTitle = todo["name"] as? String else {
                    print("Could not get todo title from JSON")
                    return
                }
                print("The name is: " + todoTitle)*/
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    let regionRadius: CLLocationDistance = 1
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        Map.setRegion(coordinateRegion, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        centerMapOnLocation(location: locations[0])
    }
    
    
}
