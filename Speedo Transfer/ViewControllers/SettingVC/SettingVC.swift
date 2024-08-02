//
//  SettingVC.swift
//  Speedo Transfer
//
//  Created by ihab saad on 02/08/2024.
//

import UIKit

class SettingVC: UIViewController {

    @IBOutlet weak var settingTableView: UITableView!
    var arrSetting = [Setting]()
    override func viewDidLoad() {
        super.viewDidLoad()

        arrSetting.append(Setting(nameSetting: "Change password", nameSettingLight: "Change password", image: UIImage(named: "password-outline")!))
        arrSetting.append(Setting(nameSetting: "Edit Profile", nameSettingLight: "Change your information", image: UIImage(named: "edit 1")!))
        
        navigationItem.title = "Setting"
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.register(UINib(nibName: String(describing: SettingTableCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SettingTableCell.self))
    }
}

extension SettingVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrSetting.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SettingTableCell.self), for: indexPath) as! SettingTableCell
        let model = arrSetting[indexPath.row]
        cell.setData(nameSetting: model.nameSetting, nameSettingLight: model.nameSettingLight, image: model.image)
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = .background1

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            
        case 0 :
            let changePassword = ChangePasswordVC()
            let nav = UINavigationController(rootViewController: changePassword)
            RootRouter.presentRoot(root: nav)
            
        case 1:
            let editProfileVc = EditProfileVc()
            let nav = UINavigationController(rootViewController: editProfileVc)
            RootRouter.presentRoot(root: nav)
        
        default:
            break
        }
    }
}
