//
//  APiError.swift
//  Talapaty
//
//  Created by ihab saad on 18/07/2024.
//

import Foundation


struct APiError {
    
    var code: Int
    var message: String
    
    internal init(code: Int, message: String) {
        self.code = code
        self.message = message
    }
}
