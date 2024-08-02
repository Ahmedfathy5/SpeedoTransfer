//
//  RecentTransactionsCell.swift
//  Speedo Transfer
//
//  Created by ihab saad on 31/07/2024.
//

import UIKit

class RecentTransactionsCell: UITableViewCell {
    

    @IBOutlet weak var imagePhoto: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var myCardLabel: UILabel!
    @IBOutlet weak var DateOfOperationLabel: UILabel!
    @IBOutlet weak var myPriceLabel: UILabel!
    
    
    func setData(imagePhoto: UIImage,userName: String,myCard: String,DateOfOperation: String, myPrice: String) {
        self.DateOfOperationLabel.text = DateOfOperation
        self.imagePhoto.image = imagePhoto
        self.myCardLabel.text = myCard
        self.userNameLabel.text = userName
        self.myPriceLabel.text = myPrice
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
