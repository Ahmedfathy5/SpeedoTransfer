//
//  MoreViewCell.swift
//  Speedo Transfer
//
//  Created by ihab saad on 01/08/2024.
//

import UIKit

class MoreViewCell: UITableViewCell {

    
    @IBOutlet weak var imagePhoto: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func setData(imagePhoto: UIImage, name: String){
        self.imagePhoto.image = imagePhoto
        self.nameLabel.text = name
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
