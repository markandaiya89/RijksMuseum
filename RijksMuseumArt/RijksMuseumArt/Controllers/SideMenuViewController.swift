//
//  SideMenuViewController.swift
//  RijksMuseumArt
//
//  Created by Markandaiya Harsha on 25/08/18.
//  Copyright © 2018 markandaiya. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    
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

}

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource
{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileTableViewCell
            if let currentUser = getCurrentUser(){
                cell.lblWelcomeText.text = "Welcome, \(currentUser["userName"]?.capitalized ?? "")"
            }
            cell.selectionStyle = .none
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "viewName") as! ViewNameTableViewCell
            cell.viewName.text = viewNames[(indexPath.row - 1)]
             cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"sideMenuChange"), object: nil)
        if indexPath.row > 0{
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: viewNames[(indexPath.row - 1)]), object: nil)
        }
        
    }
  
    
}
