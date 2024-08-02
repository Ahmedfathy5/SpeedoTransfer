//
//  SignUpTwoVC.swift
//  Speedo Transfer
//
//  Created by ihab saad on 31/07/2024.
//

import UIKit

class SignUpTwoVC: UIViewController, CountrySelectionDelegate {
    
    
   
    @IBOutlet weak var CountryTextFields: UITextField!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CountryTextFields.delegate = self
    }
    @IBAction func goToSignUpVC(_ sender: Any) {
        let signInVc = SignInVC()
        let nav = UINavigationController(rootViewController: signInVc)
        RootRouter.presentRoot(root: nav)
        
    }
}

// MARK: -  TextFieldDelegate
extension SignUpTwoVC: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == CountryTextFields {
            self.navigateToCountrySelection()
            return false
        } else {
            return true
        }
    }
}

extension SignUpTwoVC {
    func navigateToCountrySelection() {
        let countrySelectionVC = CountrySelectionVC()
        countrySelectionVC.delegate = self
        present(countrySelectionVC, animated: true)
//        let nav = UINavigationController(rootViewController: countrySelectionVC)
//        RootRouter.presentRoot(root: nav)
    }
    func didSelectCountry(name: String, image: UIImage) {
        self.CountryTextFields.text = name
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 2, width: 10, height: 10) // Adjust the size as needed
        imageView.contentMode = .scaleAspectFit
        self.CountryTextFields.leftView = imageView
        self.CountryTextFields.leftViewMode = .always
    }
    
}
