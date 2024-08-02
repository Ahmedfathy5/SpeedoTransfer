//
//  TransactionTableViewCell.swift
//  Speedo Transfer
//
//  Created by Ahmed Fathi on 02/08/2024.
//

import UIKit

class TransactionViewCell: UITableViewCell {
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var clientName: UILabel!
    
    @IBOutlet weak var transactionState: UIImageView!
    
    @IBOutlet weak var resultOfTransaction: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        view.layer.cornerRadius = 15

    }

    func assignData(clientName: String,transactionState: UIImage,resultOfTransaction: UIImage) {
        self.clientName.text = clientName
        self.transactionState.image = transactionState
        self.resultOfTransaction.image = resultOfTransaction
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
