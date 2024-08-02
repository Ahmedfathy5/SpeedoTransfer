//
//  FavouriteTableViewCell.swift
//  Speedo Transfer
//
//  Created by ihab saad on 01/08/2024.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var viewImage: UIView!
    
    @IBOutlet weak var imagePhoto: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var myAccountLabel: UILabel!
//    @IBOutlet weak var viewContainer: UIView!
    
    @IBOutlet weak var buttonEdit: UIButton!
    @IBOutlet weak var buttonRemove: UIButton!
    
    func setData(image: UIImage, username: String, account: String)  {
        self.imagePhoto.image = image
        self.userNameLabel.text = username
        self.myAccountLabel.text = account
    }
    override func awakeFromNib() {
        super.awakeFromNib()
       viewImage.layer.cornerRadius = 24
       view.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

