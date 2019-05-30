//
//  ViewController.swift
//  Task1
//
//  Created by Mahmoud on 5/28/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func registerButton(_ sender: UIButton) {
        performSegue(withIdentifier: "registerPage", sender: self)
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        performSegue(withIdentifier: "login", sender: self)
    }
    
}

