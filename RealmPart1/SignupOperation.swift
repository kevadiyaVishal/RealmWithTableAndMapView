//
//  SignupOperation.swift
//  RealmPart1
//
//  Created by Vishal Kevadiya on 26/02/16.
//  Copyright (c) 2016 Vishal Kevadiya. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit
class SignupOperation {
    let instance  = Realm()
    
    class var sharedInstance: SignupOperation {
        struct Static {
            
            static var instance: SignupOperation? = SignupOperation()
        }
        return Static.instance!
    }
    
    func CreateUser(user : userSignup){
        instance.write{
              SignupOperation.sharedInstance.instance.add(user)
        }
    }
    func isValidUser(username : String , pwd : String) -> Bool{
        var result = Realm().objects(userSignup)
       
        for var i = 0 ; i < result.count ; i++ {
            if (result[i].email == username && result[i].phoneNumber == pwd)
            {
               
                NSUserDefaults.standardUserDefaults().setValue(result[i].userId, forKey: "USER_INFO")
                NSUserDefaults.standardUserDefaults().synchronize()
                return true
            }
        }
        
        return false
    }
    
    func getUser() -> userSignup{
        
        let userId: AnyObject? = NSUserDefaults.standardUserDefaults().valueForKey("USER_INFO")
        let user = Realm().objectForPrimaryKey(userSignup.self, key: userId! )
         return user!
    }
    func isUserLogin() -> Bool {
        if NSUserDefaults.standardUserDefaults().valueForKey("USER_INFO") != nil{
            return true
            
        }
        return false
    }
    func logout(){
        print(NSUserDefaults.standardUserDefaults().removeObjectForKey("USER_INFO"))
        
    }
    
}
