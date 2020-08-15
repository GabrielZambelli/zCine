//
//  KeychainHelper.swift
//  zCine
//
//  Created by Gabriel Zambelli on 06/08/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

//

import Foundation
import KeychainSwift

enum Keys: String {
    case session = "session"
}

class KeychainHelper{

    //MARK: Atributes
    private let keychain = KeychainSwift()
    
    //MARK: Singleton
    static let shared = KeychainHelper()
    
    //MARK: Initialize
    private init(){
        
    }
    
    //MARK: Method
    func getSession() -> Session?{
       
        guard let data = keychain.getData(Keys.session.rawValue) else { return nil }
        
        if let session = try? JSONDecoder().decode(Session.self, from: data){
            return session
        }
        else{
            return nil
        }
    }
    
    func set(session: Session) -> Bool{
       
        if let data = try? JSONEncoder().encode(session){
            return keychain.set(data, forKey: Keys.session.rawValue)
        }
        else {
            return false
        }
    }
    
    func delete(_ key: Keys) -> Bool{
       return keychain.delete(key.rawValue)
    }
}
