//
//  HomeViewController.swift
//  RijksMuseumArt
//
//  Created by Markandaiya Harsha on 26/08/18.
//  Copyright © 2018 markandaiya. All rights reserved.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    @IBOutlet weak var tableViewArt: UITableView!
    let collection:CollectionCaller = CollectionCaller()
    var gettingArrayList:Bool = false
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
        if !gettingArrayList {
            gettingArrayList = true
            collection.getArtList {
                self.gettingArrayList = false
                delayOnMainThread(delay: 0, clousre: {
                    self.tableViewArt.reloadData()
                    self.tableViewArt.contentOffset = self.tableViewArt.contentOffset
                })
            }
        }
    }
    
    @IBAction func ShowSideMenu(_ sender: Any) {
         NotificationCenter.default.post(name: NSNotification.Name(rawValue:"sideMenuChange"), object: nil)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        dlPrint(object: sender)
        if let index = sender as? Int{
            let artDetail = segue.destination as! ArtDetailViewController
            artDetail.artDetail = collection.arrayList[index]
        }
    }
    

}

extension HomeViewController:UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collection.arrayList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtViewCell") as! ArtTableViewCell
        let artOfCell = collection.arrayList[indexPath.row]
        cell.lblArtName.text = artOfCell.title
        let imageUrl = URL(string: artOfCell.headerImage.url)
        cell.artImageView.kf.setImage(with: imageUrl, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
        cell.containerView.backgroundColor = (indexPath.row % 2 == 0) ? .white:UIColor(white: 0.90, alpha: 1.0)
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !gettingArrayList{
            if indexPath.row >= (collection.arrayList.count - 5){
                getArrayList()
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toArtDetail", sender: indexPath.row)
    }
}
