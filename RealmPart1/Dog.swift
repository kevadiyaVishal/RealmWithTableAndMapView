//
//  Dog.swift
//  RealmPart1
//
//  Created by Vishal Kevadiya on 26/02/16.
//  Copyright (c) 2016 Vishal Kevadiya. All rights reserved.
//

import Foundation
import RealmSwift

class Dog: Object {

    dynamic var name = ""
    dynamic var owner: String? = nil
    
}
