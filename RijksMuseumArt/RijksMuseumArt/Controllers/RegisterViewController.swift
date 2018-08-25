//
//  RegisterViewController.swift
//  RijksMuseumArt
//
//  Created by Markandaiya Harsha on 25/08/18.
//  Copyright © 2018 markandaiya. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtFldUserName: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var btnTerms: UIButton!
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
    @IBAction func termsTapped(_ sender: UIButton) {
        btnTerms.isSelected = !btnTerms.isSelected
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        if (!(txtFldUserName.text?.isValidString() ?? false)) {
            // if username is empty
            showAlert(on: self , with: "Error", and:userNameEmpty)
        }
        else if (!(txtFldPassword.text?.isValidString() ?? false)) {
            // if password is empty
            showAlert(on: self, with: "Error", and: passwordEmpty)
        }
        else if !(btnTerms.isSelected ) {
            // if password is empty
            showAlert(on: self, with: "Error", and: checkBoxFailure)
        }
        else{
            // call register api 
        }
    }
}
