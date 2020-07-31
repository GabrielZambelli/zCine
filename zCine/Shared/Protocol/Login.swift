//
//  Login.swift
//  zCine
//
//  Created by Gabriel Zambelli on 30/07/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation


protocol Login{
    
    func didLogin()
    func failedLogin(_ error: ZcineError)
    
}
