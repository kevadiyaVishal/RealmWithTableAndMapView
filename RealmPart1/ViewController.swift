//
//  ViewController.swift
//  RealmPart1
//
//  Created by Vishal Kevadiya on 26/02/16.
//  Copyright (c) 2016 Vishal Kevadiya. All rights reserved.
//

import UIKit

import RealmSwift
class ViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPwd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    override func loadView() {
        super.loadView()
        if(SignupOperation.sharedInstance.isUserLogin()){
            performSegueWithIdentifier("homeSegue", sender: self)
            return
       }
      
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func signUp(sender: AnyObject) {
        
        self.performSegueWithIdentifier("signup", sender: self)
    }
    override func viewWillAppear(animated: Bool)
    {
        self.navBarSetting()
    }
    func navBarSetting(){
        self.navigationController?.navigationBarHidden = true
        self.navigationController?.toolbarHidden = true
    }
    
    @IBAction func doLogin(sender: AnyObject) {
        if(SignupOperation.sharedInstance.isValidUser(userName.text, pwd: userPwd.text)){
            let homeView = self.storyboard!.instantiateViewControllerWithIdentifier("home") as! HomeViewController
            navigationController!.pushViewController(homeView, animated: false)

        }
        else
        {
            self.setAlertViw("Login Box", msg: "Email or Password Mitchmatch", cancelButton: "ok")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "signup"
        {
            let SignUpViewControllerObj = segue.destinationViewController as! SignUpViewController
        }
        if segue.identifier == "homeSegue"
        {
            let SignUpViewControllerObj = segue.destinationViewController as! HomeViewController
            
        }
    }
    func setAlertViw(title : String , msg : String , cancelButton : String){
        var alert : UIAlertView = UIAlertView(title: title, message: msg, delegate: self, cancelButtonTitle: cancelButton)
        alert.show()
    }
    

}

