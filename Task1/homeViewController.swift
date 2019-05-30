//
//  homeViewController.swift
//  Task1
//
//  Created by Mahmoud on 5/28/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import UIKit
import CountryPickerViewSwift
import Firebase
import FBSDKLoginKit


class homeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func button(_ sender: UIButton) {
        let countryView = CountrySelectView.shared
        countryView.show()
        countryView.searchBarPlaceholder = "phone code"

        countryView.countryNameColor = .brown
        countryView.countryPhoneCodeFont = UIFont.systemFont(ofSize: 10)
        countryView.countryNameColor = .black
        countryView.selectedCountryCallBack = { countryDic in
            print(countryDic)
        }
    }
    
    @IBAction func logoutButton(_ sender: UIButton) {
        do{
            try Auth.auth().signOut()
        }
        catch{
            print("error: there was a problem signing out")
        }
        performSegue(withIdentifier: "goRoot", sender: self)
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
