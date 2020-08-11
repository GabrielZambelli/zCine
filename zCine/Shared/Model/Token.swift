//
//  Token.swift
//  zCine
//
//  Created by Gabriel Zambelli on 21/07/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation


struct Token: Decodable, Encodable{
    var requestToken: String
    var expiresAt: String
    
    private func isExpired() -> Bool{
        //to do Token esta valido ??
        
        return true
    }
}
