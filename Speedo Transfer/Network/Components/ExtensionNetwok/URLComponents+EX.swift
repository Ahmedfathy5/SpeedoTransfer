//
//  URLComponents+EX.swift
//  Talapaty
//
//  Created by ihab saad on 18/07/2024.
//

import Foundation


extension URLComponents {
    
    init( endPoint: EndPoint ) {
        
        let baseUrlString = Constant.API.baseURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let baseUrl = URL(string: baseUrlString)
        let fullUrl = baseUrl!.appendingPathComponent(endPoint.path)
        self.init(url: fullUrl, resolvingAgainstBaseURL: true)!
        guard let parmters = endPoint.parmters else { return }
        
        queryItems = parmters.map({ key, value in
            return URLQueryItem(name: key, value: String(describing: value))
        })
    }
}
