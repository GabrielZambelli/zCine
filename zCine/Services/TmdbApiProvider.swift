//
//  TmdbProvider.swift
//  zCine
//
//  Created by Gabriel Zambelli on 19/07/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation

typealias HTTPHeader = [String:String]
typealias HTTPBody = [String:String]
typealias parameters = [String: String]

enum HTTPMethod: String {
    case GET = "GET", POST = "POST", DELETE = "DELETE"
}

enum TmdbApiEndPoint: String {
    case RequestToken = "/authentication/token/new"
    case SessionWithLogin = "/authentication/token/validate_with_login"
    case GuestSession = "/authentication/guest_session/new"
    case CreateSession = "/authentication/session/new"
}

class TmdbApiProvider {
    
    //MARK: -- Properties
    
    private let basePath: String = "https://api.themoviedb.org/3"
    private let timeOut: Int = 30
    private var session: URLSession?
    private let apiKey: String = "2e14b7780bd8e44aab2fc82bc1f241cc"
    
    //MARK: -- Singleton
       static let shared = TmdbApiProvider()
    
    //MARK: Inicializer
    
    private init (){
        let configuration =  URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = TimeInterval(timeOut)
        configuration.timeoutIntervalForResource = TimeInterval(timeOut)
        session =  URLSession(configuration: configuration)
    }
    
    //MARK: -- Public Methods
    
    func getApiKey() -> String{
        return apiKey
    }
    
    func request<T: Decodable>(_ type: T.Type, endPoint: TmdbApiEndPoint, httpMethod:HTTPMethod = .GET, header: HTTPHeader = [:], parameters:parameters = [:], body: HTTPBody = [:], complete: @escaping (Result<T, ZcineError>) -> Void ) {
        
        guard let urlRequest = buidUrlResquest(endPoint.rawValue, method: httpMethod, parameter: parameters, body: body, header: header) else {
            complete(.failure(.badURL))
            return
        }
        
        let task = session?.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            
            if let _ = error{
                complete(.failure(.badTask))
            }
            
            guard let response = response as? HTTPURLResponse else {
                complete(.failure(.badResponse))
                return
            }
            
            if (response.statusCode == 200){
                
                guard let data = data else {
                    complete(.failure(.badData))
                    return
                }
                
                let jsonDecode = JSONDecoder()
                jsonDecode.keyDecodingStrategy = .convertFromSnakeCase
                
                if let result = try? jsonDecode.decode(type.self, from: data){
                    complete(.success(result))
                }
                else {
                    complete(.failure(.badJson))
                }
                
            }
            else{
                complete(.failure(.badStatusCode(code: response.statusCode)))
            }
            
            })
        
        task?.resume()
        
    }
    
    
    //MARK: -- Private  Methods
    
    private func buidUrlResquest(_ endPoint: String, method: HTTPMethod, parameter:parameters, body: HTTPBody, header: HTTPHeader) -> URLRequest? {
        
        var url = URL(string: self.basePath + endPoint)
        url = url?.appending(parameter: parameter)
        
        if let url = url {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = method.rawValue
            urlRequest.allHTTPHeaderFields = header
            
            switch method {
            case .POST, .DELETE:
                urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body)
            default:
                urlRequest.httpBody = nil
            }
            
            return urlRequest
        }
        else{ return nil }
    }
}
