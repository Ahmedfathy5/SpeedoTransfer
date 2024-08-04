//
//  ConfirmationTransferViewController.swift
//  Speedo Transfer
//
//  Created by Ahmed Fathi on 02/08/2024.
//

import UIKit

class ConfirmationTransferViewController: UIViewController {

    
    @IBOutlet weak var rect1: UIView!
    
    @IBOutlet weak var rect2: UIView!
    
    @IBOutlet weak var rect3: UIView!
    
    
    @IBOutlet weak var confirmBtn: UIButton!
    
    @IBOutlet weak var lbl1: UILabel!
    
    @IBOutlet weak var lbl2: UILabel!
    
    @IBOutlet weak var lbl3: UILabel!
    
    @IBOutlet weak var fromView: UIView!
    
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var toView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Transfer"
        
        
        
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
        
        fromView.layer.cornerRadius = 15
        toView.layer.cornerRadius = 15
        
        previousBtn.layer.borderWidth = 2
        previousBtn.layer.borderColor = UIColor(named:"Primary 1" )?.cgColor
        previousBtn.layer.cornerRadius = 10
          
        
        confirmBtn.layer.cornerRadius = 10
        
        
        let backButtonImage = UIImage(named: "Vector 3") // Replace with your image name
        let backButton = UIButton(type: .custom)
        backButton.setImage(backButtonImage, for: .normal)
        backButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButtonItem
        
        
        
        
    }
    
    @objc func backButtonTapped() {
        let vc = MainTabbarVC()
        let nav = UINavigationController(rootViewController: vc)
        RootRouter.presentRoot(root: nav)
       
    }


    @IBAction func goToPayment(_ sender: Any) {
        
        let vc = PaymentTransferViewController()
        let nav = UINavigationController(rootViewController: vc)
        RootRouter.presentRoot(root: nav)
        
    }
    

}
