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
        
        setUpNavigationView()
        setUpUI()
    }
    
    private func setUpUI() {
        fromView.layer.cornerRadius = 15
        toView.layer.cornerRadius = 15
        transferAmountView.layer.cornerRadius = 15
    }
    
    private func setUpNavigationView() {
        navigationItem.title = "Successful Transactions"
        let backButtonImage = UIImage(named: "Vector 3")
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
}
