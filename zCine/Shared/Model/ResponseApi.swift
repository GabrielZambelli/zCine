//
//  ResponseApi.swift
//  zCine
//
//  Created by Gabriel Zambelli on 27/07/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation



struct ResponseApi: Decodable {
    
    let code: Int
    let message: String
    let success: Bool?
    

    enum CodingKeys: String, CodingKey {
        
        case code = "status_code"
        case message = "status_message"
        case success = "success"
        
    }
    
}


