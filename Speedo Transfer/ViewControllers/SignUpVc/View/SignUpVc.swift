//
//  SignUpVc.swift
//  Speedo Transfer
//
//  Created by ihab saad on 31/07/2024.
//

import UIKit
import RxSwift


class SignUpVc: UIViewController {

    
//    MARK: - OutLets
    @IBOutlet weak var fullNameTextFields: UITextField!
    @IBOutlet weak var emailTextFields: UITextField!
    @IBOutlet weak var phoneTextFields: UITextField!
    @IBOutlet weak var userNameTextFields: UITextField!
    @IBOutlet weak var passwordTextFields: UITextField!
    @IBOutlet weak var confirmPasswordTextFields: UITextField!
    
    private var activityIndicator: UIActivityIndicatorView?
       var viewModel: SignUpViewModel
       private let disposeBag = DisposeBag()
       
       init() {
           self.viewModel = SignUpViewModel()
           super.init(nibName: String(describing: Self.self), bundle: nil)
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       override func viewDidLoad() {
           super.viewDidLoad()
           title = "Sign Up"
           
           setupActivityIndicator()
           bindViewModel()
       }
       
       @IBAction func goToContinueSignUp(_ sender: Any) {
           let fullName = fullNameTextFields.text?.trimed ?? ""
           let email = emailTextFields.text?.trimed ?? ""
           let phoneNumber = phoneTextFields.text?.trimed ?? ""
           let username = userNameTextFields.text?.trimed ?? ""
           let password = passwordTextFields.text?.trimed ?? ""
           let confirmPassword = confirmPasswordTextFields.text?.trimed ?? ""
           
           let model = RegisterForm(fullName: fullName,
                                    email: email,
                                    phoneNumber: phoneNumber,
                                    username: username,
                                    password: password,
                                    confirmPassword: confirmPassword)
           viewModel.register(model: model)
           
       }
       
       private func bindViewModel() {
           viewModel.screen.subscribe(onNext: { [weak self] state in
               switch state {
               case .showLoading:
                   self?.showLoadingAnimation()
                   
               case .hideLoading:
                   self?.hideLoadingAnimation()
                   
               case .success:
                   self?.showAlert(message: "Registration successful")
                   
               case let .error(error):
                   self?.showAlert(message: error)
                   
               case let .navigateToSignUpTwo(model):
                   // First show the loading animation, then delay the transition
                   self?.showLoadingAnimation()
                   DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                       self?.hideLoadingAnimation()
                       self?.navigateToSignUpTwoScreen(with:model)
                   }
               }
           }).disposed(by: disposeBag)
       }
       
       private func setupActivityIndicator() {
           activityIndicator = UIActivityIndicatorView(style: .large)
           activityIndicator?.center = view.center
           activityIndicator?.hidesWhenStopped = true
           view.addSubview(activityIndicator!)
       }
       
       private func showLoadingAnimation() {
           print("Showing loading animation")
           activityIndicator?.isHidden = false
           activityIndicator?.startAnimating()
       }
       
       private func hideLoadingAnimation() {
           print("Hiding loading animation")
           activityIndicator?.stopAnimating()
           activityIndicator?.isHidden = true
       }
       
    func navigateToSignUpTwoScreen(with model: RegisterForm) {
        let signUpTwoVC = SignUpTwoVC( model: model)
        self.navigationController?.pushViewController(signUpTwoVC, animated: true)
    }
       
       func showAlert(message: String) {
           let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           alert.addAction(okAction)
           self.present(alert, animated: true, completion: nil)
       }
   }
