//
//  ProfileTableViewCell.swift
//  Speedo Transfer
//
//  Created by ihab saad on 01/08/2024.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var viewImage: UIView!
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var nameSettingLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    
    func setData(image: UIImage, nameSetting: String, details: String) {
        self.detailsLabel.text = details
        self.imageProfile.image = image
        self.nameSettingLabel.text = nameSetting
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        viewImage.layer.cornerRadius = 4
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
