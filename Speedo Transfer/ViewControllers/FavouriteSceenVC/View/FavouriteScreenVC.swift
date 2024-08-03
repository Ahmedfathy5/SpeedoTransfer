//
//  FavouriteScreenVC.swift
//  Speedo Transfer
//
//  Created by ihab saad on 01/08/2024.
//

import UIKit

class FavouriteScreenVC: UIViewController {
    
    @IBOutlet weak var favTableView: UITableView!
    var arrFav = [FavouriteList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Favourite"
        //
        favTableView.delegate = self
        favTableView.dataSource = self
        arrFav.append(FavouriteList(image: UIImage(named: "bank 1")!, userName: "Ihab Saad", account: "Account xxxx7890"))
        arrFav.append(FavouriteList(image: UIImage(named: "bank 1")!, userName: "Ihab Saad", account: "Account xxxx7890"))
        arrFav.append(FavouriteList(image: UIImage(named: "bank 1")!, userName: "Ihab Saad", account: "Account xxxx7890"))
        arrFav.append(FavouriteList(image: UIImage(named: "bank 1")!, userName: "Ihab Saad", account: "Account xxxx7890"))
        
        favTableView.register(UINib(nibName: String(describing: FavouriteTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: FavouriteTableViewCell.self))
    }
}
    extension FavouriteScreenVC: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           arrFav.count
        }
    
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FavouriteTableViewCell.self), for: indexPath) as! FavouriteTableViewCell
   
        let model = arrFav[indexPath.row]
        cell.setData(image: model.image, username: model.userName, account: model.account)

         cell.buttonEdit.tag = indexPath.row
          cell.buttonEdit.addTarget(self, action: #selector(buttonTappedGoToEditFav), for: .touchUpInside)
       cell.buttonRemove.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
         return cell
    }
    
      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
               return  95
       }
    }
    extension FavouriteScreenVC{
       @objc func buttonTappedGoToEditFav(){
           let EditFavouriteVC = EditFavouriteVC()
           present(EditFavouriteVC, animated: true)
       }
       @objc func buttonTapped(_ sender: UIButton) {
               let indexPath = IndexPath(row: sender.tag, section: 0)
              let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete ?", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
               alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { _ in
                   self.arrFav.remove(at: indexPath.row)
                   self.favTableView.reloadData()
             }))
                present(alert, animated: true, completion: nil)
            }

}
