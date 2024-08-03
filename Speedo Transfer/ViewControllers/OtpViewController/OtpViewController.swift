//
//  OtpViewController.swift
//  Speedo Transfer
//
//  Created by ihab saad on 03/08/2024.
//

import UIKit

class OtpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Bank Card OTP"
    }
    @IBAction func presentSuccessfullyVC(_ sender: Any) {
        let SuccessfullyAccountVC =  SuccessfullyAccountVC()
        let nav = UINavigationController(rootViewController: SuccessfullyAccountVC)
        RootRouter.presentRoot(root: nav)
    }
    
}
