//
//  SignInViewModel.swift
//  Speedo Transfer
//
//  Created by ihab saad on 05/08/2024.
//

import Foundation
import RxSwift
import UIKit

enum ScreenLoginViewModel {
    case showLoading
    case hideLoading
    case completed
    case error(messageError: String)
}

class SignInViewModel {
    
    // MARK: - Properties
    var authRepo = AuthRepo()
    let stateLogin = PublishSubject<ScreenLoginViewModel>()
    
    // MARK: - Login User
    func login(email: String, password: String) -> Bool{
        
        
        stateLogin.onNext(.showLoading)
        
        let model = LoginForm(email: email, password: password)
        
        // MARK: - Response Data
        authRepo.login(form: model) { [weak self] response in
            self?.stateLogin.onNext(.hideLoading)
            switch response {
            case .onSuccess:
                self?.stateLogin.onNext(.completed)
            case let .onMistake(error):
                let errorMessage = "\(error.code) ... \(error.message)"
                self?.stateLogin.onNext(.error(messageError: errorMessage))
                
            }
            
        }
        return true
    }
}
