//
//  ResonseAPI.swift
//  Talapaty
//
//  Created by ihab saad on 14/07/2024.
//

import Foundation

enum ResponseAPI<T: Codable> {
     case onSuccess(T)
     case onMistake(APiError)
}

