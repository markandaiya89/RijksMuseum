//
//  ArtTableViewCell.swift
//  RijksMuseumArt
//
//  Created by Markandaiya Harsha on 26/08/18.
//  Copyright © 2018 markandaiya. All rights reserved.
//

import UIKit

class ArtTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblArtName: UILabel!
    @IBOutlet weak var artImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
