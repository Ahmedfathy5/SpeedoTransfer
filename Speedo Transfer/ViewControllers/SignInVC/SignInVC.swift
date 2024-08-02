//
//  SignInVC.swift
//  Speedo Transfer
//
//  Created by ihab saad on 31/07/2024.
//

import UIKit

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    @IBAction func SignInBtn(_ sender: UIButton) {
        let nav = UINavigationController(rootViewController: MainTabbarVC())
        RootRouter.presentRoot(root: nav)
    }
}
