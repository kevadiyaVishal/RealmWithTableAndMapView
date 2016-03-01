//
//  CategoryViewController.swift
//  RealmPart1
//
//  Created by Vishal Kevadiya on 29/02/16.
//  Copyright (c) 2016 Vishal Kevadiya. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mytblView: UITableView!
    var Categories = [Category]()
    var selectedCatedCategory = Category()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationController?.navigationBarHidden = true
        navigationController?.toolbarHidden = true
        CategoryOperation.sharedInstance.addCategory()
        Categories = CategoryOperation.sharedInstance.returnAllCategory()
   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : CustomCellTableViewCell = self.mytblView.dequeueReusableCellWithIdentifier("CategoryCell", forIndexPath: indexPath) as! CustomCellTableViewCell
        cell.textLabel?.text = Categories[indexPath.row].name as String
        return cell
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(Categories.count)
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
   
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        selectedCatedCategory = Categories[indexPath.row]
        return indexPath
    }
    
}

/*



override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
return Int(categories.count)
}

override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
let cell = tableView.dequeueReusableCellWithIdentifier("CategoryCell", forIndexPath: indexPath) as! UITableViewCell

return cell
}


override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath {

return indexPath
}

}
*/