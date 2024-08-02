//
//  CountrySelectionVC.swift
//  Speedo Transfer
//
//  Created by ihab saad on 31/07/2024.
//

import UIKit


protocol CountrySelectionDelegate: AnyObject {
    func didSelectCountry(name: String, image: UIImage)
}

class CountrySelectionVC: UIViewController {

    @IBOutlet weak var CountrysTableView: UITableView!
    weak var delegate: CountrySelectionDelegate?
    var arrData = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))
        arrData.append(Country(name: "united states", image: UIImage(named: "united states")!))

        CountrysTableView.delegate = self
        CountrysTableView.dataSource = self
        CountrysTableView.register(UINib(nibName: String(describing:CountryTableViewCell.self ), bundle: nil), forCellReuseIdentifier: String(describing: CountryTableViewCell.self))
    }
}
extension CountrySelectionVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CountryTableViewCell.self), for: indexPath) as! CountryTableViewCell
        
        let model = arrData[indexPath.row]
        cell.setDat(nameCountry: model.name, imageCountry: model.image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = arrData[indexPath.row]
            delegate?.didSelectCountry(name: country.name, image: country.image)
            self.navigationController?.popViewController(animated: true)
        dismiss(animated: true)
        
    }
}
