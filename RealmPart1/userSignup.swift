//
//  userSignup.swift
//  RealmPart1
//
//  Created by Vishal Kevadiya on 26/02/16.
//  Copyright (c) 2016 Vishal Kevadiya. All rights reserved.
//

import Foundation
import RealmSwift

class userSignup: Object {

       
    dynamic var userId  = NSUUID().UUIDString
    dynamic var firstName = String?()
    dynamic var lastName = String?()
    dynamic var email = String?()
    dynamic var phoneNumber = String?()
    dynamic var created = NSDate()
    
    override static func primaryKey() -> String? {
        return "userId"
    }
    
    
}
