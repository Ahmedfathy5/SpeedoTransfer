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
        
        navigationController?.navigationBar.isHidden = true
        bindViewModel()
        let backButtonImage = UIImage(named: "Vector 3")
        let backButton = UIButton(type: .custom)
        backButton.setImage(backButtonImage, for: .normal)
        backButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButtonItem
    }

    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func SignInBtn(_ sender: UIButton) {
        let email = emailTextFields.text?.trimed ?? ""
        let password = passwordTextFields.text?.trimed ?? ""
        if  viewModel.login(email: email, password: password) {
            let mainTabbarVC = MainTabbarVC()
            RootRouter.presentRoot(root: mainTabbarVC)
        } else {
            self.showAlert(message: "Error")
        }
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
                       print("completed")
                    case .error:
                        self?.showAlert(message: "error")
                    }
                }).disposed(by: disposeBag)
        }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
