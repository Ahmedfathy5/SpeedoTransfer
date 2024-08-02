//
//  SplashScreenVC.swift
//  Speedo Transfer
//
//  Created by ihab saad on 31/07/2024.
//

import UIKit

class SplashScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.goToSignUpVC()
        }
    }
    
    func goToSignUpVC(){
        let signUpVc = SignUpVc()
        let nav = UINavigationController(rootViewController: signUpVc)
        RootRouter.presentRoot(root: nav)
    }

}
