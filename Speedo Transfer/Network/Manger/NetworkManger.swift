

import Foundation

class NetworkManger {
    
//    MARK: - Properties
  private var task: URLSessionDataTask? = nil
  private var loger = Loger()
    

//    MARK: - requestAPI CAll
    func requestAPI<T: Codable>(of type: T.Type,  endPoint: EndPoint, completion: @escaping (ResponseAPI<T>) -> Void) {
        
       
        
         guard let fullUrl = URLComponents(endPoint: endPoint).url else { return}
          var request = URLRequest(url: fullUrl, timeoutInterval: Constant.API.timeoutInterval)
              request.httpMethod = endPoint.methods.rawValue
              request.allHTTPHeaderFields = endPoint.Headers
        request.allHTTPHeaderFields =  ["Accept": "application/json", "Content-Type": "application/json", "token": MangerLocal.shard.getAuthToken() ?? "" ]
         if let body = endPoint.body , ![HttpMethod.get, HttpMethod.delete].contains(endPoint.methods) {
         guard  let dic = (body as? Codable)?.asDictionary() else { return }
             print(dic)
            request.httpBody = try? JSONSerialization.data(withJSONObject: dic)
        }
         
//    MARK: -  CAll API
        task = URLSession.shared.dataTask(with: request) { Data, response, error in
            
            self.logerData(task: self.task, body: endPoint.body, data: Data, resonse: response, error: error )
            // Check for data
              guard let Data else {
                    let apiError = APiError(code: 0, message: "Error, No't Back Data API 🔻")
                         completion(.onMistake(apiError))
                        return
            }
            
              // Check for response
              guard let response = response as? HTTPURLResponse else {
                    let apiError = APiError(code: 0, message: "Error, No't Back resopnse API 🔻")
                        completion(.onMistake(apiError))
                        return
            }
              // Check for successful response status
              guard (200...299).contains(response.statusCode) else {
              // Attempt to decode failure response
              guard let fail = try? JSONDecoder().decode(Fail.self, from: Data) else {
                    let apiError = APiError(code: response.statusCode, message:  "Error, message API")
                        completion(.onMistake(apiError))
                        return
                  }
                    let apiError = APiError(code: response.statusCode, message: fail.message ?? "")
                        return completion(.onMistake(apiError))
                  }
          do {
                // Attempt to decode failure response
                let data = try JSONDecoder().decode(type, from: Data)
                    completion(.onSuccess(data))
      } catch {
                let apiError = APiError(code: response.statusCode, message: error.localizedDescription)
                    completion(.onMistake(apiError))
            }
        }
        task?.resume()
    }
}

//MARK: - private Func
extension NetworkManger {
    
    private func logerData(task: URLSessionDataTask? ,body: Any?, data: Data?, resonse: URLResponse?, error: Error?) {
        let url: String = task?.originalRequest?.url?.absoluteString ?? ""
        let response: String = String(data: data ?? Data(), encoding: .utf8) ?? ""
        let headers: APIHeaders = task?.originalRequest?.allHTTPHeaderFields ?? [:]
       let statusCode: Int = (resonse as! HTTPURLResponse).statusCode
        loger.printlogerData(url: url, response: response, headers: headers, body: body, statusCode: statusCode, error: error)
    }
}

