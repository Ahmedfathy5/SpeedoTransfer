//
//  TransferViewController.swift
//  Speedo Transfer
//
//  Created by Ahmed Fathi on 31/07/2024.
//

import UIKit

class TransferViewController: UIViewController {
    @IBOutlet weak var rect1: UIView!
    
    @IBOutlet weak var rect2: UIView!
    
    @IBOutlet weak var rect3: UIView!
    
    
    
    @IBOutlet weak var lbl1: UILabel!
    
    @IBOutlet weak var lbl2: UILabel!
    
    @IBOutlet weak var lbl3: UILabel!
    
    @IBOutlet weak var currencyView: UIView!
    
    @IBOutlet weak var transferView: UIView!
    @IBOutlet weak var textFieldUSD: UITextField!
    
    @IBOutlet weak var textFieldEGP: UITextField!
    
    @IBOutlet weak var continueBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Transfer"
        view.backgroundColor = UIColor(named: "Background")
        
        rect1.layer.cornerRadius = 17
        lbl1.layer.cornerRadius = 15
        lbl1.adjustsFontSizeToFitWidth = true
        lbl1.layer.masksToBounds = true
        
        rect2.layer.cornerRadius = 17
        lbl2.layer.cornerRadius = 15
        lbl2.adjustsFontSizeToFitWidth = true
        lbl2.layer.masksToBounds = true
        
        rect3.layer.cornerRadius = 17
        lbl3.layer.cornerRadius = 15
        lbl3.adjustsFontSizeToFitWidth = true
        lbl3.layer.masksToBounds = true
        
        currencyView.layer.cornerRadius = 15
        
        textFieldUSD.layer.borderColor = UIColor.gray.cgColor
        textFieldUSD.layer.borderWidth = 2
        textFieldUSD.layer.cornerRadius = 5
        
        textFieldEGP.layer.borderColor = UIColor.gray.cgColor
        textFieldEGP.layer.borderWidth = 2
        textFieldEGP.layer.cornerRadius = 5
        
        transferView.layer.cornerRadius = 15
        continueBtn.layer.cornerRadius = 6
       
        


    }
    
    @IBAction func goToFavoriteList(_ sender: Any) {
        let vc = FavoriteListViewController()
        let nav = UINavigationController(rootViewController: vc)
        RootRouter.presentRoot(root: nav)
    }
    
    @IBAction func goToConfirmation(_ sender: Any) {
        let vc = ConfirmationTransferViewController()
        let nav = UINavigationController(rootViewController: vc)
        RootRouter.presentRoot(root: nav)
        
    }
    
}
