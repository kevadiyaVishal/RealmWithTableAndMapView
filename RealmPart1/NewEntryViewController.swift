//
//  NewEntryViewController.swift
//  RealmPart1
//
//  Created by Vishal Kevadiya on 29/02/16.
//  Copyright (c) 2016 Vishal Kevadiya. All rights reserved.
//

import UIKit

class NewEntryViewController: UIViewController,UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var category: UITextField!
    @IBOutlet weak var namr: UITextField!
    @IBOutlet weak var descr: UITextView!
    
    var selectedAnnotation : Speciman!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func validateFields() -> Bool {
        if namr.text.isEmpty || descr.text.isEmpty {
            let alertController = UIAlertController(title: "Validation Error", message: "All fields must be filled", preferredStyle: .Alert)
            let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler: {(alert : UIAlertAction!) in
                alertController.dismissViewControllerAnimated(true, completion: nil)
            })
            alertController.addAction(alertAction)
            presentViewController(alertController, animated: true, completion: nil)
            
            return false
            
        } else {
            return true
        }
        
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        println("callede")
        performSegueWithIdentifier("Categories", sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Categories"
        {
            let CategoryView = segue.destinationViewController as! CategoryViewController
        }
    }
    
    /*

    
    @IBAction func unwindFromCategories(segue: UIStoryboardSegue) {
    let categoriesController = segue.sourceViewController as! CategoriesTableViewController
    
    }@IBAction func unwindFromAddNewEntry(segue: UIStoryboardSegue) {
    
    let addNewEntryController = segue.sourceViewController as! AddNewEntryController
    
    if (lastAnnotation != nil) {
    mapView.removeAnnotation(lastAnnotation)
    } else {
    for annotation in mapView.annotations {
    
    }
    }
    
    lastAnnotation = nil;
    
    }
    
    
    //MARK: - Actions
    
    //  override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
    //    
    //  }
    
    }


    */

}
