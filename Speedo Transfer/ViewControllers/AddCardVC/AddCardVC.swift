//
//  AddCardVC.swift
//  Speedo Transfer
//
//  Created by ihab saad on 02/08/2024.
//

import UIKit

class AddCardVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Add Card"
        let backButtonImage = UIImage(named: "Vector 3") // Replace with your image name
        let backButton = UIButton(type: .custom)
        backButton.setImage(backButtonImage, for: .normal)
        backButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButtonItem
    }

    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func checkCardButtonTapped(_ sender: Any) {
        let ConnectingCardVC = ConnectingCardVC()
        let nav = UINavigationController(rootViewController: ConnectingCardVC)
        RootRouter.presentRoot(root: nav)
    }
}







