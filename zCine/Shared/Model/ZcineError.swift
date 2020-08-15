//
//  zcineError.swift
//  zCine
//
//  Created by Gabriel Zambelli on 23/07/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation


public enum ZcineError: Error{
    
    case badURL
    case badTask
    case badResponse
    case badStatusCode(code: Int)
    case badJson
    case badData
    case badToken
    case badSession
}
