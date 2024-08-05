//
//  SignUpViewModel.swift
//  Speedo Transfer
//
//  Created by ihab saad on 03/08/2024.
//

import Foundation
import RxSwift

class SignUpViewModel {
    
    enum SignUpState {
        case showLoading
        case hideLoading
        case success
        case error(error: String)
        case navigateToSignUpTwo(model: RegisterForm)
    }
    
    var screen = PublishSubject<SignUpState>()
    private var registeredUser: RegisterForm?
    
    func register(model: RegisterForm) {
        screen.onNext(.showLoading)
        
        if let errorMessage = validate(model: model) {
            self.screen.onNext(.error(error: errorMessage))
            self.screen.onNext(.hideLoading)
            return
        }
        
        self.registeredUser = model
        self.screen.onNext(.hideLoading)
        self.navigateToSignUpTwo()
    }
    
    private func validate(model: RegisterForm) -> String? {
        
        if model.fullName.trimed.isEmpty {
            return "Full name is required."
        }
        if model.email.trimed.isEmpty || !isValidEmail(model.email) {
            return "Valid email is required."
        }
        if !isValidEgyptianPhoneNumber(phoneNumber: model.phoneNumber.trimed) {
            return "Valid Egyptian phone number is required."
        }
        if model.username.trimed.isEmpty {
            return "Username is required."
        }
        if model.password.trimed.isEmpty {
            return "Password is required."
        }
        if model.confirmPassword.trimed.isEmpty {
            return "Confirm password is required."
        }
        if model.password.trimed != model.confirmPassword.trimed {
            return "Passwords do not match."
        }
        
        return nil
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    private func isValidEgyptianPhoneNumber(phoneNumber: String) -> Bool {
        let phoneRegex = "^((\\+20)|(0020)|(0))1[0125][0-9]{8}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phoneNumber)
    }
    
    private func navigateToSignUpTwo() {
        guard let user = registeredUser else { return }
        screen.onNext(.navigateToSignUpTwo(model: user))
    }
}
