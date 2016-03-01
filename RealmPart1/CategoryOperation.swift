//
//  CategoryOperation.swift
//  RealmPart1
//
//  Created by Vishal Kevadiya on 29/02/16.
//  Copyright (c) 2016 Vishal Kevadiya. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

class CategoryOperation {
    let instance  = Realm()
    var Categories : [Category] = [Category]()
    
    class var sharedInstance: CategoryOperation {
        struct Static {
            
            static var instance: CategoryOperation? = CategoryOperation()
        }
        return Static.instance!
}
    func addCategory(){
        
        instance.beginWrite()
        println(Realm().path)
        if instance.objects(Category).count == 0 {
            let DefaultCategory = ["Birds", "Mammals", "Flora", "Reptiles", "Arachnids" ]
            for category in DefaultCategory {
            let newCategory = Category()
                newCategory.name = category
                self.instance.add(newCategory, update: false)
            }
            instance.commitWrite()
            
        }    }
    
    func returnAllCategory() -> [Category]{
        var obj = instance.objects(Category)
        for var index = 0 ; index < obj.count ; index++ {
            Categories.append(obj[index])
        }
        return Categories
    }

}