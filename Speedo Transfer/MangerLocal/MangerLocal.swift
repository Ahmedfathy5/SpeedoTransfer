//
//  File.swift
//  Talapaty
//
//  Created by ihab saad on 28/07/2024.
//
import UIKit
import Foundation

  class MangerLocal {
    
   
//    thread safe or not thread safe?
//    hoe to make singletone thread safe
    
  static let shard = MangerLocal()
    let userDef = UserDefaults.standard
    
    enum KeysToken: String {
       case id = "#Token"
    }
    
    func setAuthToken(token: String) {
        userDef.setValue(token, forKey: KeysToken.id.rawValue)
    }
    func getAuthToken() -> String? {
        userDef.string(forKey: KeysToken.id.rawValue)
    }
    func removeAuthToken(){
        userDef.removeObject(forKey: KeysToken.id.rawValue)
    }
}
