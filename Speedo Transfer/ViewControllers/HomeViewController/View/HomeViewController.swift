//
//  HomeViewController.swift
//  Speedo Transfer
//
//  Created by Ahmed Fathi on 31/07/2024.
//

import UIKit


class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameOfUser: UILabel!
    
    
    var userDetails: UserDetails?
    var arrData = [RecentTransactions]()
    private let ApiCaller = NetworkManager2()
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
           fetchData()
        
        
        
        arrData.append(.init(userName: "ihabSaad", myCard: "Visa . Mater Card . 1234", DateOfOperation: "Today 11:00 - Received", price: "$1000", image: UIImage(named: "Group image")!))
        arrData.append(.init(userName: "ihabSaad", myCard: "Visa . Mater Card . 1234", DateOfOperation: "Today 11:00 - Received", price: "$1000", image: UIImage(named: "Group image")!))
        arrData.append(.init(userName: "ihabSaad", myCard: "Visa . Mater Card . 1234", DateOfOperation: "Today 11:00 - Received", price: "$1000", image: UIImage(named: "Group image")!))
        arrData.append(.init(userName: "ihabSaad", myCard: "Visa . Mater Card . 1234", DateOfOperation: "Today 11:00 - Received", price: "$1000", image: UIImage(named: "Group image")!))
        arrData.append(.init(userName: "ihabSaad", myCard: "Visa . Mater Card . 1234", DateOfOperation: "Today 11:00 - Received", price: "$1000", image: UIImage(named: "Group image")!))
        arrData.append(.init(userName: "ihabSaad", myCard: "Visa . Mater Card . 1234", DateOfOperation: "Today 11:00 - Received", price: "$1000", image: UIImage(named: "Group image")!))
        arrData.append(.init(userName: "ihabSaad", myCard: "Visa . Mater Card . 1234", DateOfOperation: "Today 11:00 - Received", price: "$1000", image: UIImage(named: "Group image")!))
        arrData.append(.init(userName: "ihabSaad", myCard: "Visa . Mater Card . 1234", DateOfOperation: "Today 11:00 - Received", price: "$1000", image: UIImage(named: "Group image")!))

        // Do any additional setup after loading the view.
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: String(describing: RecentTransactionsCell.self), bundle: nil), forCellReuseIdentifier: String(describing: RecentTransactionsCell.self))
    }
    

    
    func fetchData() {
      
        ApiCaller.fetchData(baseURL: Constants.userDetailsEndPoint) { [weak self] result in
                
                    switch result {
                    case .success(let userDetails):
                        DispatchQueue.main.async {
                            self?.userDetails = userDetails
                            
                            self?.nameOfUser.text = userDetails.fullName
                        }
                      
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }

        }
        
       
        }

    



extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecentTransactionsCell.self), for: indexPath) as! RecentTransactionsCell
        let model = arrData[indexPath.row]
        cell.setData(imagePhoto: model.image, userName: model.userName, myCard: model.myCard, DateOfOperation: model.DateOfOperation, myPrice: model.price)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        95
    }
}
