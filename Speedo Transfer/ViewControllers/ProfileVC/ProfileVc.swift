//
//  ProfileVc.swift
//  Speedo Transfer
//
//  Created by ihab saad on 01/08/2024.
//

import UIKit

class ProfileVc: UIViewController {
    
    @IBOutlet weak var ProfileTableView: UITableView!
    
    var arrProfile = [ProfileSetting]()
    override func viewDidLoad() {
        super.viewDidLoad()

        arrProfile.append(ProfileSetting(name: "Personal information", details: "Your information", image: UIImage(named: "frame")!))
        arrProfile.append(ProfileSetting(name: "Setting", details: "Change your settings", image: UIImage(named: "Setting")!))
        arrProfile.append(ProfileSetting(name: "Payment history", details: "view your transactions", image: UIImage(named: "History 5")!))
        arrProfile.append(ProfileSetting(name: "My Favourite list", details: "view your favourites", image: UIImage(named: "Vector 1")!))
        
        ProfileTableView.delegate = self
        ProfileTableView.dataSource = self
        ProfileTableView.register(UINib(nibName: String(describing: ProfileTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ProfileTableViewCell.self))
    }
}

extension ProfileVc: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrProfile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfileTableViewCell.self), for: indexPath) as! ProfileTableViewCell
        let model = arrProfile[indexPath.row]
        cell.setData(image: model.image, nameSetting: model.name, details: model.details)
        
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = .background1
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        88
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let ProfileInformationVC = ProfileInformationVC()
            let nav = UINavigationController(rootViewController: ProfileInformationVC)
            RootRouter.presentRoot(root: nav)
            
        case 1 :
            let settingVc = SettingVC()
            let nav = UINavigationController(rootViewController: settingVc)
            RootRouter.presentRoot(root: nav)
        default:
            break
        }
    }
}
