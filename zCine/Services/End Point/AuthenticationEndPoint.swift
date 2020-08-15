//
//  AuthProvider.swift
//  zCine
//
//  Created by Gabriel Zambelli on 20/07/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation

extension TmdbApiProvider {
  
    func requestToken(complete: @escaping (Result<Token, ZcineError>) -> Void){
        
        let parameter = ["api_key":self.getApiKey()]
        
        request(Token.self, endPoint: .RequestToken, httpMethod: .GET, parameters: parameter) { (result) in
            
            switch result{
            case .success(let token):
                complete(.success(token))
                break
            case .failure(let error):
                complete(.failure(error))
                break
            }
        }
        
    }
    
    func validationToken(userName: String, password: String, token: Token, complete: @escaping (Result<Token, ZcineError>) -> Void ){
        
        let parameter = ["api_key":self.getApiKey()]
        
        let body = ["username": userName,
                    "password": password,
                    "request_token": token.requestToken]
        
        let header = ["Content-Type":"application/json"]
        
        request(Token.self, endPoint: .SessionWithLogin, httpMethod: .POST, header:header ,parameters: parameter, body: body) { (result) in
            
            switch result{
            case .success(let validatedToken ):
                complete(.success(validatedToken))
            case .failure(let error):
                complete(.failure(error))
            }
        }
    }
    
    
    func creatSession(validatedToken:Token, complete: @escaping(Result<Session, ZcineError>) -> Void){
        
        let parameter = ["api_key":self.getApiKey()]
        let body = ["request_token": validatedToken.requestToken]
        let header = ["Content-Type":"application/json"]
        
        request(Session.self, endPoint: .CreateSession, httpMethod: .POST, header: header,  parameters: parameter, body: body) { (result) in
            switch result{
            case .success(let session):
                if(session.success){
                    let sessionValid = Session(token: validatedToken, sessionId: session.sessionId, success: session.success)
                    complete(.success(sessionValid))
                }
                else{
                    complete(.failure(.badSession))
                }
                
                break
            case .failure(let error):
                complete(.failure(error))
                break
            }
        }
    }
}


