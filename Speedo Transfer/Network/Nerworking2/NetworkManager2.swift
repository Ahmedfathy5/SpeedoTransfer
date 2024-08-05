//
//  NetworkManager2.swift
//  Speedo Transfer
//
//  Created by Ahmed Fathi on 05/08/2024.
//

import Foundation



class NetworkManager2 {
    
    static let ApiCaller = NetworkManager2()
    
        let token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxQGdtYWlsLmNvbSIsImp0aSI6IjIiLCJpYXQiOjE3MjI4ODk1MDUsImV4cCI6MTcyMjg5MTMwNX0.JcWO-6jGIbDmJ5buGbejF5cEuSC4XJDxOb-BT-29p1c"
        
        
        

        
    func fetchData(baseURL: String,completion: @escaping (Result< UserDetails , Error>) -> Void) {
            guard let url = URL(string: baseURL) else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
    //            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
    //                let statusCodeError = NSError(domain: "", code: (response as? HTTPURLResponse)?.statusCode ?? 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])
    //                completion(.failure(statusCodeError))
    //                return
    //            }
                
                guard let data = data else {
                    let dataError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data"])
                    completion(.failure(dataError))
                    return
                }
                
                do {
                    let userDetails = try JSONDecoder().decode(UserDetails.self, from: data)
                    print(userDetails)
                    completion(.success(userDetails))
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        }
    }

