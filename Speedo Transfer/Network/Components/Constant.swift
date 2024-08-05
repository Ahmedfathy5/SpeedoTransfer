//
//  Constant.swift
//  Talapaty
//
//  Created by ihab saad on 14/07/2024.
//

import Foundation

struct Constant {

//MARK:  URL
    enum API {
       static let baseURL = "https://speedo-transfer-437e318f5416.herokuapp.com/api/"
       static let timeoutInterval = 40.4
    }

    enum Path {
        
        //MARK:  login
       static let login = "auth/login"
        
        //MARK:  register
       static let register = "auth/register"
    
    }
    enum Keys {
        static let pageSize = "pageSize"
        static let pageNumber = "pageNumber"
    }
}

