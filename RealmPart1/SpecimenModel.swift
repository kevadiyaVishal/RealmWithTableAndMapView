//
//  SpecimenModel.swift
//  RealmPart1
//
//  Created by Vishal Kevadiya on 29/02/16.
//  Copyright (c) 2016 Vishal Kevadiya. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit
class SpecimenModel: Object {
    
    dynamic var name = ""
    dynamic var specimenDescription = ""
    dynamic var latitude: Double = 0.0
    dynamic var longitude: Double = 0.0
    dynamic var created = NSDate()
    
    
    // Relationship one to Many
    
    dynamic var category = Category()
  
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
