//
//  MapPin.swift
//  MAMaps
//
//  Created by Muneeb Ali on 08/06/2018.
//  Copyright © 2018 Muneeb Ali. All rights reserved.
//

import Foundation
import MapKit

class MapPin: NSObject, MKAnnotation {
    
    var title: String?
    var locationName: String
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
}


class ImageMapPin: NSObject, MKAnnotation {
    
    var title: String?
    var locationName: String
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
}
