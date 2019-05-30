//
//  secViewController.swift
//  Task1
//
//  Created by Mahmoud on 5/28/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit
import GoogleSignIn

class secViewController: UIViewController, LoginButtonDelegate, GIDSignInUIDelegate {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    var emailAddress=""
    var passwordreg = ""
    var confirm = ""
    var checkfbLogin = false
    let loginButton = FBLoginButton()
    let googleButton = GIDSignInButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // --------------------------- facebook button ----------------------------
        loginButton.frame = CGRect(x:0, y:48*9, width: view.frame.width, height: 50)
        loginButton.delegate=self
        view.addSubview(loginButton)
        
        
        
        // --------------------------- Google button ------------------------------
        googleButton.frame = CGRect(x:0, y:48*10, width: view.frame.width, height: 50)
        view.addSubview(googleButton)
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    
    //  --------------------------- facebook button handeling ----------------------------
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if(error != nil){
            print(error!)
        }
        else{
            if AccessToken.current != nil{
                checkfbLogin = true
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (AccessToken.current != nil && checkfbLogin == true)
        {
            performSegue(withIdentifier: "home", sender: self)
            let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if error != nil{
                    print(error!)
                }
            }
        }
    }
    
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("logged out")
    }
    
    @IBAction func goHome(_ sender: UIButton) {
        if Auth.auth().currentUser != nil {
            print("signed in")
            GIDSignIn.sharedInstance().signOut()
            ProgressHUD.showSuccess("logged Successfully")
            performSegue(withIdentifier: "home", sender: self)
        } else {
            print("signed out")
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        performSegue(withIdentifier: "back", sender: self)
    }
    @IBAction func registerButton(_ sender: UIButton) {
        
        emailAddress = email.text!
        passwordreg = password.text!
        confirm = confirmPassword.text!
        
        if passwordreg == confirm{
            Auth.auth().createUser(withEmail: emailAddress, password: passwordreg) {
                (user, error) in
                
                if error != nil{
                    ProgressHUD.showError("invalid Data")
                    
                }
                else{
                    print("success")
                    ProgressHUD.showSuccess("Created Successfully")
                    self.performSegue(withIdentifier: "home", sender: self)
                }
            }
        }
        else{
            ProgressHUD.showError("passwords don't match")
            print("error")
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
