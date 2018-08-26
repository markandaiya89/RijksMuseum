//
//  MainViewController.swift
//  RijksMuseumArt
//
//  Created by Markandaiya Harsha on 25/08/18.
//  Copyright © 2018 markandaiya. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var sideControllerLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var homeCointerView: UIView!
    var sideMenuOpen = false
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "logout"), object: nil, queue: nil) { (_) in
            delayOnMainThread(delay: 0.0, clousre: {
                self.dismiss(animated: true, completion: {
                    
                })
            })
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "sideMenuChange"), object: nil, queue: nil) { (_) in
            delayOnMainThread(delay: 0, clousre: {
               self.ShowSideMenu(self)
            })
            
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func ShowSideMenu(_ sender: Any) {
        if sideMenuOpen {
            sideMenuOpen = false
            self.sideControllerLeadingConstraint.constant = -240
            homeCointerView.isUserInteractionEnabled = true
        }
        else {
            sideMenuOpen = true
            self.sideControllerLeadingConstraint.constant = 0
            homeCointerView.isUserInteractionEnabled = false
        }
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutSubviews()
            
        }
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

}
