//
//  HomeViewController.swift
//  RijksMuseumArt
//
//  Created by Markandaiya Harsha on 26/08/18.
//  Copyright © 2018 markandaiya. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableViewArt: UITableView!
    let collection:CollectionCaller = CollectionCaller()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getArrayList()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getArrayList()->Void{
        collection.getArtList {
            
        }
    }
    
    @IBAction func ShowSideMenu(_ sender: Any) {
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

extension HomeViewController:UITableViewDataSource,UITabBarDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collection.arrayList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtViewCell") as ArtTableViewCell
        
    }
}
