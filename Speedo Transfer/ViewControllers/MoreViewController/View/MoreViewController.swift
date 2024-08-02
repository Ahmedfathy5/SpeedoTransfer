//
//  MoreViewController.swift
//  Speedo Transfer
//
//  Created by Ahmed Fathi on 31/07/2024.
//

import UIKit

class MoreViewController: UIViewController {

    @IBOutlet weak var moreTableView: UITableView!
    
    
    var arrMore = [More]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "More"
        
        arrMore.append(.init(image: UIImage(named: "website")!, name: "Transfer From Website"))
        arrMore.append(.init(image: UIImage(named: "favorite")!, name: "Favourites"))
        arrMore.append(.init(image: UIImage(named: "user")!, name: "Profile"))
        arrMore.append(.init(image: UIImage(named: "fill")!, name: "Help"))
        arrMore.append(.init(image: UIImage(named: "logout")!, name: "logout"))

//       title = "More"
        moreTableView.separatorStyle = .singleLine
        moreTableView.delegate = self
        moreTableView.dataSource = self
        moreTableView.register(UINib(nibName: String(describing: MoreViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MoreViewCell.self))
        
    }
}

extension MoreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrMore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MoreViewCell.self), for: indexPath) as! MoreViewCell
        
        let model = arrMore[indexPath.row]
        cell.setData(imagePhoto: model.image, name: model.name)
        
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
                  cell.accessoryView = nil
              } else {
                  let arrowImageView = UIImageView(image: UIImage(named: "Chevron"))
//                  arrowImageView.backgroundColor = UIColor.background1
                  arrowImageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
                  
                  cell.accessoryView = arrowImageView
              }
               cell.selectionStyle = .none
              return cell
          }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
           case 1:
               let favouriteScreenVC = FavouriteScreenVC()
//            present(favouriteScreenVC, animated: true)
            let nav = UINavigationController(rootViewController: favouriteScreenVC)
                RootRouter.presentRoot(root: nav)
            
        case 2 :
            let profileVc = ProfileVc()
            let nav = UINavigationController(rootViewController: profileVc)
            RootRouter.presentRoot(root: nav)
        case 3 :
            let helpVc = HelpVc()
         present(helpVc, animated: true)
           default:
               break
           }
    }
          
    }
        
    

