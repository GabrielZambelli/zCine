//
//  File.swift
//  zCine
//
//  Created by Gabriel Zambelli on 15/07/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation


protocol LoginModel{
    
    func didLogin()
    func failedLogin(_ error: ZcineError)
}


class LoginViewModel {
    
    var delegate: LoginModel?
    private var token:Token?
    private var validToken: Token?
    private var session:Session?
 
    
    func validLogin(userName: String, password: String){
        requestToken()
        validToken(userName, password)
        createSession()
    }
    
    private func createSession(){
        guard let validToken = validToken else {
            self.delegate?.failedLogin(.badToken)
            return
        }
        TmdbApiProvider.shared.creatSession(validatedToken: validToken) { (result) in
            switch result{
            case.success(let session):
                
                if(KeychainHelper.shared.set(session: session)){
                    self.delegate?.didLogin()
                }else{
                    self.delegate?.failedLogin(.badSession)
                }
                
                break
            case .failure(let error):
                self.delegate?.failedLogin(error)
                break
            }
        }
    }
    
    private func validToken(_ userName: String, _ password: String){
        
        guard let token = token else {
            self.delegate?.failedLogin(.badToken)
            return
        }
        
        TmdbApiProvider.shared.validationToken(userName: userName, password: password, token: token) { (result) in
            switch result{
            case .success(let token):
                self.validToken = token
                break
            case .failure(let error):
                self.delegate?.failedLogin(error)
                break
                
            }
        }
    }
    
    private func requestToken(){
        TmdbApiProvider.shared.requestToken { (result) in
            switch result{
            case .success(let token):
                self.token = token
                break
            case .failure(let error):
                self.delegate?.failedLogin(error)
                break
            }
        }
    }
}
