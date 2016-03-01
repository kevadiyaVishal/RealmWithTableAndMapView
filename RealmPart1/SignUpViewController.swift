//
//  SignUpViewController.swift
//  RealmPart1
//
//  Created by Vishal Kevadiya on 26/02/16.
//  Copyright (c) 2016 Vishal Kevadiya. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var mobile: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(animated: Bool) {
        setitingNavbar()
    }
    
    func setitingNavbar()
    {
        navigationController?.navigationBarHidden = false
    }

    
    @IBAction func singupMe(sender: AnyObject) {
        // code to Create User 
        
        if (checkValidation()) {
            let newUser = userSignup()
            newUser.firstName = firstname.text
            newUser.lastName = lastName.text
            newUser.email = email.text
            newUser.phoneNumber = mobile.text
            newUser.created = NSDate()
            SignupOperation.sharedInstance.CreateUser(newUser)
            navigationController?.popToRootViewControllerAnimated(true)
        }
        
     }
    
    func checkValidation() -> Bool {
        
        var flag : Bool = true
        if (firstname.text == ""){
            firstname.layer.borderWidth = 0.5
            firstname.layer.borderColor = UIColor.redColor().CGColor
            flag = false
        }
        if (lastName.text == "")
        {
            lastName.layer.borderWidth = 0.5
            lastName.layer.borderColor = UIColor.redColor().CGColor
            flag = false
        }
        if (email.text == "")
        {
            email.layer.borderWidth = 0.5
            email.layer.borderColor = UIColor.redColor().CGColor
            flag = false
        }
        if (mobile.text == "")
        {
            mobile.layer.borderWidth = 0.5
            mobile.layer.borderColor = UIColor.redColor().CGColor
            flag = false
        }
        
        return flag
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
   
}
