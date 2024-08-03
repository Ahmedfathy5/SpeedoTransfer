//
//  SuccessfulTransactionViewController.swift
//  Speedo Transfer
//
//  Created by Ahmed Fathi on 02/08/2024.
//

import UIKit

class SuccessfulTransactionViewController: UIViewController {
    @IBOutlet weak var fromView: UIView!
    
    @IBOutlet weak var toView: UIView!
    
    @IBOutlet weak var transferAmountView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Successful Transactions"
        
        
        fromView.layer.cornerRadius = 15
        toView.layer.cornerRadius = 15
        transferAmountView.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }


    

}
