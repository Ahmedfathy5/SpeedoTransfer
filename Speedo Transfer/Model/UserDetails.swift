//
//  UserDetails.swift
//  Speedo Transfer
//
//  Created by Ahmed Fathi on 05/08/2024.
//

import Foundation


struct UserDetails: Codable {
    
    let userId: String?
    let fullName: String?
    let email: String?
    let phoneNumber: String?
    let gender: String?
    let birthDate: String?
    let username: String?
    
}
enum Gender: String,Codable {
    case MALE = "MALE"
    case FEMALE = "FEMALE"
}

