//
//  AuthServices.swift
//  Talapaty
//
//  Created by ihab saad on 26/07/2024.
//

import Foundation

protocol AuthServicesProtocol {
    func register(form: RegisterForm, completion: @escaping(ResponseAPI<RegisterResponse>) -> Void )
    func login(form: LoginForm, completion: @escaping(ResponseAPI<AuthTokenOperation>) -> Void)
}

class AuthServices: AuthServicesProtocol {
    func register(form: RegisterForm, completion: @escaping (ResponseAPI<RegisterResponse>) -> Void) {
        let endPoint = EndPoint(path: Constant.Path.register, methods: .post, body: form)
        NetworkManger().requestAPI(of: RegisterResponse.self, endPoint: endPoint, completion: completion)
    }
    
    
    func login(form: LoginForm, completion: @escaping(ResponseAPI<AuthTokenOperation>) -> Void) {
        let endPoint = EndPoint(path: Constant.Path.login, methods: .post, body: form)
        NetworkManger().requestAPI(of: AuthTokenOperation.self, endPoint: endPoint, completion: completion)
    }
}
