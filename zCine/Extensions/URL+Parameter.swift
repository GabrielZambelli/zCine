//
//  URL+Parameter.swift
//  zCine
//
//  Created by Gabriel Zambelli on 23/07/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation


extension URL {
    
    mutating func appending(parameter: parameters) -> Self? {
        
        
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true)!
       
        var queryItens = urlComponents.queryItems ?? []
        
        queryItens.append(contentsOf: parameter.map({ URLQueryItem(name: $0, value: String.init(describing: $1))
        }))
        urlComponents.queryItems = queryItens
        //self = urlComponents.url ?? self
        
        return urlComponents.url as Self?
    }
    
}


