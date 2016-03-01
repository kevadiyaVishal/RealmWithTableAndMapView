//
//  Speciman.swift
//  RealmPart1
//
//  Created by Vishal Kevadiya on 29/02/16.
//  Copyright (c) 2016 Vishal Kevadiya. All rights reserved.
//

import MapKit
import UIKit

class Speciman : NSObject , MKAnnotation{
    
    var coordinate: CLLocationCoordinate2D
    var title: String
    var subtitle: String
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }

}

