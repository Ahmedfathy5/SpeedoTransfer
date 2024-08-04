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

        setUpNavigationController()
        
    }
    
    func setUpNavigationController() {
        navigationItem.title = "Add Card"
        let backButtonImage = UIImage(named: "Vector 3")
        let backButton = UIButton(type: .custom)
        backButton.setImage(backButtonImage, for: .normal)
        backButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButtonItem
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
        cancelButton.tintColor = .black
        self.navigationItem.rightBarButtonItem = cancelButton
    }
    
    @objc func cancelButtonTapped() {
        self.dismiss(animated: true)
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







