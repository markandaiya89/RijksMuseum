//
//  ContainerViewController.swift
//  RijksMuseumArt
//
//  Created by Markandaiya Harsha on 25/08/18.
//  Copyright © 2018 markandaiya. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    @IBOutlet weak var homeViewContainer: UIView!
    
    @IBOutlet weak var profileViewContrainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.performSegue(withIdentifier: "toHome", sender: nil)
        
        // setting up notification centers.
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: viewNames[0]), object: nil, queue: nil) { (_)  in
            self.showHomeView()
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: viewNames[1]), object: nil, queue: nil) { (_)  in
            self.showProfileView()
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showHomeView() -> Void {
        delayOnMainThread(delay: 0) {
            self.navigationController?.popToRootViewController(animated: false)
            self.performSegue(withIdentifier: "toHome", sender: nil)
        }
    }
    func showProfileView() ->Void {
        delayOnMainThread(delay: 0) {
            self.navigationController?.popToRootViewController(animated: false)
            self.performSegue(withIdentifier: "showProfile", sender: nil)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        dlPrint(object: "segue")
    }
    
    @IBAction func showSideMenu(_ sender: Any) {
        NotificationCenter.default.post(name:  NSNotification.Name(rawValue:"sideMenuChange"), object: nil)
    }
    
}
