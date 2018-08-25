//
//  LoginViewController.swift
//  RijksMuseumArt
//
//  Created by Markandaiya Harsha on 25/08/18.
//  Copyright © 2018 markandaiya. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var txtFldUsername: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func loginTapped(_ sender: UIButton) {
        if (!(txtFldUsername.text?.isValidString() ?? false)) {
            // if username is empty
            showAlert(on: self , with: "Error", and:userNameEmpty)
        }
        else if (!(txtFldPassword.text?.isValidString() ?? false)) {
            // if password is empty
            showAlert(on: self, with: "Error", and: passwordEmpty)
        }
        else {
            // if data is valid call login api
        }
    }
    
}
