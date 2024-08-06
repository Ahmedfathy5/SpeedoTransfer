//
//  SignUpTwoVC.swift
//  Speedo Transfer
//
//  Created by ihab saad on 31/07/2024.
//

import UIKit
import RxSwift

class SignUpTwoVC: UIViewController, CountrySelectionDelegate {
    
    @IBOutlet weak var CountryTextFields: UITextField!
    @IBOutlet weak var genderTextFields: UITextField!
    @IBOutlet weak var dateOfBirthTextFields: UITextField!
    
        private var model: RegisterForm
        private var viewModel: SignUpTwoViewModel
        private var datePicker: UIDatePicker?
        private var genderPicker: UIPickerView?
        private let genderOptions = ["MALE", "FEMALE"]
        private let disposeBag = DisposeBag()
        private var loadingIndicator: UIActivityIndicatorView?
        
        init(model: RegisterForm) {
            self.viewModel = SignUpTwoViewModel()
            self.model = model
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupGenderPicker()
            setupDatePicker()
            genderPicker?.delegate = self
            genderPicker?.dataSource = self
            dateOfBirthTextFields.delegate = self
            CountryTextFields.delegate = self
            animateTextFields()
            bindViewModel()
            
            navigationController?.navigationBar.isHidden = true
            
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
        
        @IBAction func goToSignInnVc(_ sender: Any) {
            guard let genderText = genderTextFields.text?.trimmingCharacters(in: .whitespaces),
                  let countryText = CountryTextFields.text?.trimmingCharacters(in: .whitespaces),
                  let birthDateText = dateOfBirthTextFields.text?.trimmingCharacters(in: .whitespaces) else {
                print("One or more text fields are empty.")
                return
            }
            
            model.gender = genderText
            model.country = countryText
            model.birthDate = birthDateText
            
            print("Received model:")
            print("fullName: \(model.fullName)")
            print("email: \(model.email)")
            print("phoneNumber: \(model.phoneNumber)")
            print("username: \(model.username)")
            print("password: \(model.password)")
            print("confirmPassword: \(model.confirmPassword)")
            print("gender: \(model.gender ?? "Not provided")")
            print("country: \(model.country ?? "Not provided")")
            print("birthDate: \(model.birthDate ?? "Not provided")")
            
            viewModel.register(model: model)
        }
        
       
        
        
        private func navigateToSignInScreen() {
            DispatchQueue.main.async {
                let signInVC = SignInVC(model: self.model)
                self.navigationController?.pushViewController(signInVC, animated: true)
            }
        }
        
        private func showAlert(message: String) {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        private func bindViewModel() {
            viewModel.screen.subscribe(onNext: { [weak self] state in
                DispatchQueue.main.async {
                    switch state {
                    case .showLoading:
                        print("")
                    case .hideLoading:
                        print("")
                    case .success:
                        self?.navigateToSignInScreen()
                    case .error(let error):
                        self?.showAlert(message: error)
                    case .navigateToSignIn(let model):
                            let signInVC = SignInVC(model: model)
                            self?.navigationController?.pushViewController(signInVC, animated: false)
                        }
                 }
                
            }).disposed(by: disposeBag)
        }
    }

    // MARK: - UITextFieldDelegate
    extension SignUpTwoVC: UITextFieldDelegate {
        func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            if textField == CountryTextFields {
                self.navigateToCountrySelection()
                return false
            } else if textField == dateOfBirthTextFields {
                return true
            }
            return true
        }
        
        private func animateTextFields() {
            CountryTextFields.transform = CGAffineTransform(translationX: 0, y: 30)
            genderTextFields.transform = CGAffineTransform(translationX: 0, y: 30)
            dateOfBirthTextFields.transform = CGAffineTransform(translationX: 0, y: 30)
            
            CountryTextFields.alpha = 0
            genderTextFields.alpha = 0
            dateOfBirthTextFields.alpha = 0
            
            UIView.animate(withDuration: 0.6, delay: 0.2, options: [.curveEaseOut], animations: {
                self.CountryTextFields.transform = .identity
                self.genderTextFields.transform = .identity
                self.dateOfBirthTextFields.transform = .identity
                
                self.CountryTextFields.alpha = 1
                self.genderTextFields.alpha = 1
                self.dateOfBirthTextFields.alpha = 1
            })
        }
        
        @IBAction func animateTextFieldsButtonTapped(_ sender: Any) {
            animateTextFields()
        }
    }

    // MARK: - CountrySelectionDelegate
    extension SignUpTwoVC {
        func navigateToCountrySelection() {
            let countrySelectionVC = CountrySelectionVC()
            countrySelectionVC.delegate = self
            present(countrySelectionVC, animated: true)
        }
        
        func didSelectCountry(name: String, image: UIImage) {
            self.CountryTextFields.textAlignment = .left
            CountryTextFields.text = name
        }
    }

    // MARK: - Date Picker and Gender Picker
    extension SignUpTwoVC {
        private func setupDatePicker() {
            datePicker = UIDatePicker()
            datePicker?.datePickerMode = .date
            datePicker?.preferredDatePickerStyle = .wheels
            datePicker?.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
            
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
            
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
            toolbar.setItems([doneButton], animated: true)
            
            dateOfBirthTextFields.inputView = datePicker
            dateOfBirthTextFields.inputAccessoryView = toolbar
        }
        
        @objc private func dateChanged() {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            if let datePicker = datePicker {
                dateOfBirthTextFields.text = dateFormatter.string(from: datePicker.date)
            }
        }
        
        @objc private func donePressed() {
            dateOfBirthTextFields.resignFirstResponder()
        }
        
        private func setupGenderPicker() {
            genderPicker = UIPickerView()
            genderPicker?.delegate = self
            genderPicker?.dataSource = self
            
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
            
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(genderDonePressed))
            toolbar.setItems([doneButton], animated: true)
            
            genderTextFields.inputView = genderPicker
            genderTextFields.inputAccessoryView = toolbar
        }
        
        @objc private func genderDonePressed() {
            genderTextFields.resignFirstResponder()
        }
    }

    // MARK: - UIPickerViewDelegate, UIPickerViewDataSource
    extension SignUpTwoVC: UIPickerViewDelegate, UIPickerViewDataSource {
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return genderOptions.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return genderOptions[row]
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            genderTextFields.text = genderOptions[row]
        }
    }
