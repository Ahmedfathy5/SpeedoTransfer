//
//  SuccessfullyAccountVC.swift
//  Speedo Transfer
//
//  Created by ihab saad on 03/08/2024.
//

import UIKit

class SuccessfullyAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Bank Card OTP"
    }


    @IBAction func backToHome(_ sender: UIButton) {
        let vc = MainTabbarVC()
        let nav = UINavigationController(rootViewController: vc)
        RootRouter.presentRoot(root: nav)
        
    }
    

}
