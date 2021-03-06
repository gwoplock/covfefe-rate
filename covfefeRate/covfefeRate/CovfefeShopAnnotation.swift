//
//  CovfefeShopAnnotation.swift
//  covfefeRate
//
//  Created by Garrett Battaglia on 3/9/18.
//  Copyright © 2018 Garrett Battaglia. All rights reserved.
//

import MapKit

class CovfefeShopAnnotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
