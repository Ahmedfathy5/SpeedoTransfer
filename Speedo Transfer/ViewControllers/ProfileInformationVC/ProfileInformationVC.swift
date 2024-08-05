//
//  ProfileInformationVC.swift
//  Speedo Transfer
//
//  Created by ihab saad on 02/08/2024.
//

import UIKit

class ProfileInformationVC: UIViewController {
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var birthOfDate: UILabel!
    @IBOutlet weak var nameOfUser: UILabel!
    private var userDetails: UserDetails?
    override func viewDidLoad() {
        super.viewDidLoad()
fetchData()
        navigationItem.title = "Profile information"
    }

    func fetchData() {
        NetworkManager2.ApiCaller.fetchData(baseURL: Constants.userDetailsEndPoint) { [weak self] result in
                
                    switch result {
                    case .success(let userDetails):
                        DispatchQueue.main.async {
                            self?.userDetails = userDetails
                            
                            self?.nameOfUser.text = userDetails.fullName
                            self?.birthOfDate.text = userDetails.birthDate
                            self?.userEmail.text = userDetails.email
                        }
                      
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
        
        
        
    }

}
