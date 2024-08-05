//
//  SignInVC.swift
//  Speedo Transfer
//
//  Created by ihab saad on 31/07/2024.
//

import UIKit
import RxSwift

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailTextFields: UITextField!
    @IBOutlet weak var passwordTextFields: UITextField!
    
    private var model: RegisterForm
    var viewModel: SignInViewModel
    private let disposeBag = DisposeBag()
    
    init(model: RegisterForm) {
        self.viewModel = SignInViewModel()
        self.model = model
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    @IBAction func SignInBtn(_ sender: UIButton) {
        let email = emailTextFields.text?.trimed ?? ""
        let password = passwordTextFields.text?.trimed ?? ""
        viewModel.login(email: email, password: password)
    }
    
    private func bindViewModel() {
            viewModel.stateLogin
                .subscribe(onNext: { [weak self] state in
                    switch state {
                    case .showLoading:
                        // Show loading spinner or indicator
                        break
                    case .hideLoading:
                        // Hide loading spinner or indicator
                        break
                    case .completed:
                        self?.presentHomeVC()
                    case .error:
                        self?.showAlert(message: "error")
                    }
                }).disposed(by: disposeBag)
        }
    
    private func presentHomeVC() {
        let MainTabbarVC = MainTabbarVC()
        navigationController?.pushViewController(MainTabbarVC, animated: true)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
