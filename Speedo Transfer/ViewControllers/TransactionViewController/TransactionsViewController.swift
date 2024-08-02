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
        title = "Transactions"
        
        transactionTableViewCell.delegate = self
        transactionTableViewCell.dataSource = self
        
        transactionTableViewCell.register(UINib(nibName: String(describing: TransactionViewCell.self) , bundle: nil), forCellReuseIdentifier: String(describing: TransactionViewCell.self))
        
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
    
}
