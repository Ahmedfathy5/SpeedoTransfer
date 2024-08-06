//
//  TransactionsViewController.swift
//  Speedo Transfer
//
//  Created by Ahmed Fathi on 31/07/2024.
//

import UIKit

class TransactionsViewController: UIViewController {
    
    @IBOutlet weak var transactionTableViewCell: UITableView!
    
    
    var arrOfCell:[Transaction] = [
        Transaction(name: "Ahmed Elsaka", transactionState: UIImage(named: "redBank")!, resultOfTransaction: UIImage(named: "faild")!),
        Transaction(name: "Ahmed Elsaka", transactionState: UIImage(named: "redVisa")!, resultOfTransaction: UIImage(named: "successful")!),
        Transaction(name: "Ahmed Elsaka", transactionState: UIImage(named: "redBank")!, resultOfTransaction: UIImage(named: "faild")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        setUpNavigationView()
    }
    
    private func setUpTableView(){
        transactionTableViewCell.delegate = self
        transactionTableViewCell.dataSource = self
        
        transactionTableViewCell.register(UINib(nibName: String(describing: TransactionViewCell.self) , bundle: nil), forCellReuseIdentifier: String(describing: TransactionViewCell.self))
        
    }
    
    private  func setUpNavigationView(){
        navigationItem.title = "Transactions"
        let backButtonImage = UIImage(named: "Vector 3") // Replace with your image name
        let backButton = UIButton(type: .custom)
        backButton.setImage(backButtonImage, for: .normal)
        backButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        let backBarButtonItem = UIBarButtonItem(customView: backButton)
       // self.navigationItem.leftBarButtonItem = backBarButtonItem
    }
    
    @objc func backButtonTapped() {
        let vc = MainTabbarVC()
        let nav = UINavigationController(rootViewController: vc)
        RootRouter.presentRoot(root: nav)
    }
    
}

extension TransactionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrOfCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TransactionViewCell.self), for: indexPath) as? TransactionViewCell else { return UITableViewCell() }
        let data = arrOfCell[indexPath.row]
        cell.assignData(clientName:data.name , transactionState: data.transactionState, resultOfTransaction: data.resultOfTransaction)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SuccessfulTransactionViewController()
        let nav = UINavigationController(rootViewController: vc)
        RootRouter.presentRoot(root: nav)
    }
    
}
