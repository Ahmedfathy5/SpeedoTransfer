//
//  RegisterForm.swift
//  Speedo Transfer
//
//  Created by ihab saad on 03/08/2024.
//

import Foundation


struct RegisterForm: Codable, CustomStringConvertible {
   
    let  fullName: String
    let  email: String
    let  phoneNumber: String
    let  username: String
    let  password: String
    let  confirmPassword: String
    var  gender: String?
    var  country: String?
    var  birthDate: String?
    
    internal init(fullName: String, email: String, phoneNumber: String, username: String, password: String, confirmPassword: String, gender: String? = nil, country: String? = nil, birthDate: String? = nil) {
        
        self.fullName = fullName
        self.email = email
        self.phoneNumber = phoneNumber
        self.username = username
        self.password = password
        self.confirmPassword = confirmPassword
        self.gender = gender
        self.country = country
        self.birthDate = birthDate
    }
    
    var description: String {
           return """
           fullName: \(fullName)
           email: \(email)
           phoneNumber: \(phoneNumber)
           username: \(username)
           password: \(password)
           confirmPassword: \(confirmPassword)
           gender: \(gender ?? "Not provided")
           country: \(country ?? "Not provided")
           birthDate: \(birthDate ?? "Not provided")
           """
       }
    }
 

