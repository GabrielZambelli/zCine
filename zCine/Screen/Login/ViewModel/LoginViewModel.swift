//
//  File.swift
//  zCine
//
//  Created by Gabriel Zambelli on 15/07/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation


protocol LoginModel: class{
    func didLogin()
    func failedLogin(_ error: ZcineError)
}

class LoginViewModel {
    
    
    //MARK -- Attributes
    
    weak var delegate: LoginModel?
    private var token:Token?
    private var validToken: Token?
    private var session:Session?
    let service: TmdbApiProvider
 
    
    //MARK: -- Init
    
    init (with service: TmdbApiProvider){
        self.service = service
    }
    
    
    //MARK: -- Methods
    func validLogin(userName: String, password: String){
        requestToken(){
            self.validToken(userName, password){
                 self.createSession()
            }
        }
    }
    
    private func createSession(){
        guard let validToken = validToken else {
            self.dispatchFailed(.badToken)
            return
        }
        service.creatSession(validatedToken: validToken) { [weak self]
            (result) in
            guard let self = self else { return }
            switch result{
            case.success(let session):
                
                if(KeychainHelper.shared.set(session: session)){
                    DispatchQueue.main.async {
                     self.delegate?.didLogin()
                    }
                }else{
                    self.dispatchFailed(.badSession)
                }
                
                break
            case .failure(let error):
                self.dispatchFailed(error)
                break
            }
        }
    }
    
    private func validToken(_ userName: String, _ password: String, complete: @escaping () -> Void){
        
        guard let token = token else {
            self.dispatchFailed(.badToken)
            return
        }
        
        service.validationToken(userName: userName, password: password, token: token) { [weak self] (result) in
            guard let self = self else { return }
            switch result{
            case .success(let token):
                self.validToken = token
                complete()
                break
            case .failure(let error):
                 self.dispatchFailed(error)
                break
                
            }
        }
    }
    
    private func requestToken(complete:@escaping  () -> Void){
        service.requestToken { [weak self]  (result) in
            guard let self = self else { return }
            switch result{
            case .success(let token):
                self.token = token
                complete()
                break
            case .failure(let error):
                self.dispatchFailed(error)
                break
            }
        }
    }
    
    private func dispatchFailed(_ error: ZcineError){
        DispatchQueue.main.async {
            self.delegate?.failedLogin(error)
        }
    }
}
