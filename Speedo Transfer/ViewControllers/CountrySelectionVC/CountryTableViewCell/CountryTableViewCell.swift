//
//  CountryTableViewCell.swift
//  Speedo Transfer
//
//  Created by ihab saad on 31/07/2024.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameCountryLabel: UILabel!
    @IBOutlet weak var imageCountry: UIImageView!
    
    func setDat(nameCountry: String,imageCountry: UIImage){
        self.nameCountryLabel.text = nameCountry
        self.imageCountry.image = imageCountry
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
