//
//  TabbarVC.swift
//  Speedo Transfer
//
//  Created by Ahmed Fathi on 31/07/2024.
//

import UIKit

class MainTabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: TransferViewController())
        let vc3 = UINavigationController(rootViewController: TransactionsViewController())
        let vc4 = UINavigationController(rootViewController: MyCardsViewController())
        let vc5 = UINavigationController(rootViewController: MoreViewController())

        vc1.tabBarItem.image = UIImage(named: "home 1")
        vc2.tabBarItem.image = UIImage(named: "Transfer 1")
        vc3.tabBarItem.image = UIImage(named: "History 1")
        vc4.tabBarItem.image = UIImage(named: "Cards 1")
        vc5.tabBarItem.image = UIImage(named: "More 1")
        
        
        vc1.title = "Home"
        vc2.title = "Transfer"
        vc3.title = "Transactions"
        vc4.title = "My Cards"
        vc5.title = "More"
        
        
        // to change the background color of the TabBar.
        tabBar.tintColor = UIColor(named: "Primary")
        tabBar.barTintColor = .white
    
        
        setViewControllers([vc1,vc2,vc3,vc4,vc5], animated: true)
    }
    

   

}
