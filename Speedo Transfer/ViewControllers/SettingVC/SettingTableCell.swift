//
//  SettingTableCell.swift
//  Speedo Transfer
//
//  Created by ihab saad on 02/08/2024.
//

import UIKit

class SettingTableCell: UITableViewCell {
    
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var nameSettingLabel: UILabel!
    @IBOutlet weak var NameSettingLightLabel: UILabel!
    @IBOutlet weak var imagePhoto: UIImageView!
    
    func setData(nameSetting: String, nameSettingLight: String, image: UIImage) {
        self.imagePhoto.image = image
        self.nameSettingLabel.text = nameSetting
        self.NameSettingLightLabel.text = nameSettingLight
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = 4
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
