//
//  UiViewController.swift
//  Attendance App
//
//  Created by ihab saad on 27/07/2024.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlart(message: String ) {
        let alart = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alart.addAction(UIAlertAction(title: "Done", style: .destructive))
        present(alart, animated: true)
    }

    func showAlert(title: String, message: String, viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }

}
