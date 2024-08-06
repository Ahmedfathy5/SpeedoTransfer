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
    @IBOutlet weak var continueButton: UIButton!
    
    
    private var activityIndicator: UIActivityIndicatorView?
      var viewModel: SignUpViewModel
      private let disposeBag = DisposeBag()
      private weak var activeTextField: UITextField?

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
          
          
          continueButton.alpha = 0.3
          continueButton.isUserInteractionEnabled = false
          
          setupActivityIndicator()
          bindViewModel()
          
          // Assign delegates
          fullNameTextFields.delegate = self
          emailTextFields.delegate = self
          phoneTextFields.delegate = self
          userNameTextFields.delegate = self
          passwordTextFields.delegate = self
          confirmPasswordTextFields.delegate = self
      }

      override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
          animateTextFields()
      }

      @IBAction func goToContinueSignUp(_ sender: Any) {
          let fullName = fullNameTextFields.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
          let email = emailTextFields.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
          let phoneNumber = phoneTextFields.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
          let username = userNameTextFields.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
          let password = passwordTextFields.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
          let confirmPassword = confirmPasswordTextFields.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

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
                  print("Success SignUp")
                  
              case let .error(error):
                  self?.showAlert(message: error)
                  
              case let .navigateToSignUpTwo(model):
                  self?.showLoadingAnimation()
                  DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                      self?.hideLoadingAnimation()
                      self?.navigateToSignUpTwoScreen(with: model)
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
          let signUpTwoVC = SignUpTwoVC(model: model)
          navigationController?.pushViewController(signUpTwoVC, animated: true)
      }

      private func showAlert(message: String) {
          let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
          let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
          alert.addAction(okAction)
          self.present(alert, animated: true, completion: nil)
      }

      private func animateTextField(_ textField: UITextField, to newPosition: CGPoint) {
          UIView.animate(withDuration: 0.5, animations: {
              textField.center = newPosition
          }, completion: { _ in
              // Return the text field to its original position
              UIView.animate(withDuration: 0.5) {
                  textField.center = CGPoint(x: newPosition.x, y: newPosition.y - 10)
              }
          })
      }

      private func animateTextFields() {
          let textFields = [fullNameTextFields, emailTextFields, phoneTextFields, userNameTextFields, passwordTextFields, confirmPasswordTextFields]
          var delay = 0.0
          
          for textField in textFields {
              if let textField = textField {
                  UIView.animate(withDuration: 0.5, delay: delay, options: [], animations: {
                      textField.center.y += 10
                  }, completion: { _ in
                      UIView.animate(withDuration: 0.5) {
                          textField.center.y -= 10
                      }
                  })
                  delay += 0.1
              }
          }
      }

      private func updateContinueButtonState() {
          let fullName = fullNameTextFields.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
          let email = emailTextFields.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
          let phoneNumber = phoneTextFields.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
          let username = userNameTextFields.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
          let password = passwordTextFields.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
          let confirmPassword = confirmPasswordTextFields.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

          let allFieldsFilled = !fullName.isEmpty && !email.isEmpty && !phoneNumber.isEmpty && !username.isEmpty && !password.isEmpty && !confirmPassword.isEmpty
          
         
          let isConfirmPasswordField = activeTextField == confirmPasswordTextFields
          UIView.animate(withDuration: 0.3) {
              self.continueButton.alpha = isConfirmPasswordField ? 1.0 : (allFieldsFilled ? 1.0 : 0.3)
          }
          continueButton.isUserInteractionEnabled = allFieldsFilled || isConfirmPasswordField
      }
  }

  extension SignUpVc: UITextFieldDelegate {
      func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
          updateContinueButtonState()
          return true
      }
      
      func textFieldDidBeginEditing(_ textField: UITextField) {
          activeTextField = textField
          updateContinueButtonState()
      }
      
      func textFieldDidEndEditing(_ textField: UITextField) {
          activeTextField = nil
          updateContinueButtonState()
      }
  }
