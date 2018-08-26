//
//  ArtDetailViewController.swift
//  RijksMuseumArt
//
//  Created by Markandaiya Harsha on 26/08/18.
//  Copyright © 2018 markandaiya. All rights reserved.
//

import UIKit
import Kingfisher

class ArtDetailViewController: UIViewController {
    @IBOutlet weak var artImage: UIImageView!
    
    @IBOutlet weak var artLongName: UILabel!
    var artDetail:Art?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageUrl = URL(string: artDetail?.webImage.url ?? "")
        artImage.kf.setImage(with: imageUrl)
        artLongName.text = artDetail?.longTitle ?? ""
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
