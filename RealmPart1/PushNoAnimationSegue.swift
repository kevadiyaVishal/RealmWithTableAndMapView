//
//  PushNoAnimationSegue.swift
//  RealmPart1
//
//  Created by Vishal Kevadiya on 29/02/16.
//  Copyright (c) 2016 Vishal Kevadiya. All rights reserved.
//

import Foundation
import UIKit

class PushNoAnimationSegue: UIStoryboardSegue {
    
    override func perform() {
        let source = ViewController() as UIViewController
        if let navigation = source.navigationController {
            navigation.pushViewController(HomeViewController() as UIViewController, animated: false)
        }
    }
    
}