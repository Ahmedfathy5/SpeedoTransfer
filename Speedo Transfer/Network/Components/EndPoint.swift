//
//  EndPoint.swift
//  Talapaty
//
//  Created by ihab saad on 14/07/2024.


typealias APIHeaders = [String: String]?
typealias APIParmters = [String: Any]?

struct EndPoint {
    
    var path: String
    var methods: HttpMethod
    var parmters: APIParmters
    var Headers: APIHeaders
    var body: Any?
    
     init(path: String, methods: HttpMethod,
                        parmters: APIParmters = nil,
                        Headers: APIHeaders = nil,
                        body: Any? = nil) {
      self.path = path
      self.methods = methods
      self.parmters = parmters
      self.Headers = Headers
      self.body = body
    }
    
}


