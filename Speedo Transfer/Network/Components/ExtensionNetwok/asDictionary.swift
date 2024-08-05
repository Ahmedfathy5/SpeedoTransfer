//
//  asDictionary.swift
//  Talapaty
//
//  Created by ihab saad on 24/07/2024.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: String]? {
        
        do {
              let data = try JSONEncoder().encode(self)
    guard  let dic = try? JSONSerialization.jsonObject(with: data,
                                                       options: .allowFragments) as? [String: String] else {
                   return nil
            }
            return dic
        } catch {
                 return nil
        }
    }
}
