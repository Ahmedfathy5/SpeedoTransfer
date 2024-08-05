//
//  AuthRepo.swift
//  Talapaty
//
//  Created by ihab saad on 26/07/2024.
//

import Foundation


class AuthRepo {
    
    
//

     
    //    MARK: - Properties
    let services: AuthServicesProtocol?
    //    dependency injection
    init(services: AuthServicesProtocol? = AuthServices()) {
        self.services = services
    }
    
    func register(form: RegisterForm, completion: @escaping (ResponseAPI<RegisterResponse>) -> Void) {
        services?.register(form: form, completion: completion)
    }
    
     func login(form: LoginForm, completion: @escaping(ResponseAPI<AuthTokenOperation>) -> Void) {
         services?.login(form: form) { response in
             
             switch response {
             case let .onSuccess(authToken):
//                   Save AuthToken
                 if let authToken = authToken.token, !authToken.isEmpty {
                     print(authToken)
                    MangerLocal.shard.setAuthToken(token: authToken)
                 }
             case let .onMistake(error):
                 print(error)
            }
      }
    }
}


