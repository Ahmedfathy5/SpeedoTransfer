//
//  Loger.swift
//  Talapaty
//
//  Created by ihab saad on 24/07/2024.
//

import Foundation

class Loger {
//statusCode: Int
    func printlogerData(url: String, response: String, headers: APIHeaders, body: Any?,statusCode: Int  ,error: Error? ) {
        #if DEBUG
         print("*************** Start API ****************")
        if (200...299).contains(statusCode) {
            print(" ✅ Sucsses ✅ ")
            print("👉🏼 URL: ⎯ \(url)")
        } else {
            print(" 🚨 Fail 🚨 ")
            print("👉🏼 URL: ⎯ \(url)")
        }
        print("👉🏼 Response: ⎯ \(response)")
        if let headers {
            print("👉🏼 Headers: ⎯ \(headers)")
        }
        if let body {
            print("👉🏼 Body: ⎯ \(body)")
        }
        print("👉🏼 StatusCode: ⎯ \(statusCode)")
        print("👉🏼 Error: ⎯ \(String(describing: error))")
        print("************* End API *********************")
        #endif
    }
}
