//
//  SignUpTwoViewModel.swift
//  Speedo Transfer
//
//  Created by ihab saad on 04/08/2024.
//
import RxSwift
class SignUpTwoViewModel {
    
    enum SignUpState {
        case showLoading
        case hideLoading
        case success
        case error(String)
        case navigateToSignIn(RegisterForm)
    }
    
    private let repo = AuthRepo()
    let screen = PublishSubject<SignUpState>()
    private var registeredUser: RegisterForm?
    
    func register(model: RegisterForm) {
        screen.onNext(.showLoading)
        
       
    
        repo.register(form: model) { [weak self] response in
            switch response {
            case .onSuccess:
                self?.registeredUser = model
                self?.handleSuccess()
            case .onMistake(let apiError):
                self?.handleError(apiError)
            }
        }
    }
    
    private func handleSuccess() {
        screen.onNext(.hideLoading)
        if let user = registeredUser {
            screen.onNext(.navigateToSignIn(user))
        }
    }
    
    private func handleError(_ apiError: APiError) {
        screen.onNext(.hideLoading)
    }
}

