//
//  Token.swift
//  zCine
//
//  Created by Gabriel Zambelli on 21/07/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation


struct Token: Decodable, Encodable{
    
    let requestToken: String
    let expiresAt: String
    var session: Session?
    
    //MARK: -- Method
    func isExpired() -> Bool{
        //to do Token esta valido ??
        return true
    }
}
