//
//  SignUpVc.swift
//  Speedo Transfer
//
//  Created by ihab saad on 31/07/2024.
//

import UIKit

class SignUpVc: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Sign Up"
        // Do any additional setup after loading the view.
    }
    @IBAction func goToContinueSignUp(_ sender: Any) {
            let vc = SignUpTwoVC()
            let nav = UINavigationController(rootViewController: vc)
            RootRouter.presentRoot(root: nav)
        }
    }

