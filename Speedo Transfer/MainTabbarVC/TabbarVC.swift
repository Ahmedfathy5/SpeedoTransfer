import UIKit

class MainTabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: TransferViewController())
        let vc3 = UINavigationController(rootViewController: TransactionsViewController())
        let vc4 = UINavigationController(rootViewController: AddCardVC())
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
        
        
        
        tabBar.tintColor = .primary
        tabBar.barTintColor = .white
        tabBar.unselectedItemTintColor = .gray // Optionally, set the color for unselected items
        tabBar.isTranslucent = false
        
        // Remove the default background and shadow images
             tabBar.backgroundImage = UIImage()
             tabBar.shadowImage = UIImage()

             // Add a custom white background view
             let backgroundView = UIView(frame: tabBar.bounds)
             backgroundView.backgroundColor = .white
             backgroundView.layer.cornerRadius = 2
             backgroundView.layer.masksToBounds = true
             backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
             backgroundView.translatesAutoresizingMaskIntoConstraints = false
             tabBar.insertSubview(backgroundView, at: 0)

             // Add constraints to ensure the background view covers the tab bar
             NSLayoutConstraint.activate([
                 backgroundView.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
                 backgroundView.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
                 backgroundView.topAnchor.constraint(equalTo: tabBar.topAnchor),
                 backgroundView.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor)
             ])

             // Adjust the frame of the tab bar to account for the corner radius
             tabBar.frame = tabBar.frame.inset(by: UIEdgeInsets(top: 10, left: 2, bottom: 0, right: 2))
             
             setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
         }

         override func viewDidLayoutSubviews() {
             super.viewDidLayoutSubviews()
             // Ensure the tab bar's frame is adjusted properly after layout changes
             tabBar.frame = tabBar.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0))
         }
     }
