//
//  Session.swift
//  zCine
//
//  Created by Gabriel Zambelli on 28/07/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation


class Session: Decodable, Encodable{
    
    var token: Token?
    let sessionId: String
    let success: Bool
    
    init(token:Token, sessionId: String, success: Bool){
        self.token = token
        self.sessionId = sessionId
        self.success = success
    }
}


