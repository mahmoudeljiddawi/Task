//
//  loginViewController.swift
//  Task1
//
//  Created by Mahmoud on 5/29/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import UIKit
import Firebase

class loginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginButton(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if error != nil{
                print(error!)
                ProgressHUD.showError("Password or username is invalid")
            }
            else{
                ProgressHUD.showSuccess("Logging in")
                self.performSegue(withIdentifier: "home", sender: self)
            }
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goRoot", sender: self)
    }
    
}
