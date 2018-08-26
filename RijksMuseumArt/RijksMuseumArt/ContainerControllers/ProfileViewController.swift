//
//  ProfileViewController.swift
//  RijksMuseumArt
//
//  Created by Markandaiya Harsha on 26/08/18.
//  Copyright © 2018 markandaiya. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var lblUserName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let user = getCurrentUser(){
            lblUserName.text = user[userName]
        }
        
    }

    @IBAction func logout(_ sender: UIButton) {
        clearCurrentUser()
        NotificationCenter.default.post(name: Notification.Name(rawValue: "logout"), object: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showSideMenu(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"sideMenuChange"), object: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
