//
//  OtpViewController.swift
//  Speedo Transfer
//
//  Created by ihab saad on 03/08/2024.
//

import UIKit

class OtpViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    @IBOutlet weak var textField6: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Bank Card OTP"
        
        
        
        configureTextFields()
        
    }
    
    private func configureTextFields() {
        textField1.delegate = self
        textField2.delegate = self
        textField3.delegate = self
        textField4.delegate = self
        textField5.delegate = self
        textField6.delegate = self
        let textFields = [textField1, textField2, textField3, textField4, textField5, textField6]
        for textField in textFields {
            textField?.keyboardType = .numberPad
            textField?.textAlignment = .center
            textField?.autocapitalizationType = .none
            textField?.returnKeyType = .done
            textField?.font = UIFont.systemFont(ofSize: 24)
            textField?.tintColor = .red
            
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        let currentText = textField.text ?? ""
        let newLength = currentText.count + string.count - range.length
        return newLength <= maxLength && string.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let index = [textField1, textField2, textField3, textField4, textField5, textField6].firstIndex(of: textField) {
            if textField.text?.count == 1 && index < 5 {
                let nextTextField = [textField1, textField2, textField3, textField4, textField5, textField6][index + 1]
                nextTextField?.becomeFirstResponder()
            }
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func presentSuccessfullyVC(_ sender: Any) {
        let SuccessfullyAccountVC =  SuccessfullyAccountVC()
        let nav = UINavigationController(rootViewController: SuccessfullyAccountVC)
        RootRouter.presentRoot(root: nav)
    }
    
}
