//
//  Token.swift
//  zCine
//
//  Created by Gabriel Zambelli on 21/07/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation


struct Token: Decodable {
    var requestToken: String
    var expiresAt: String
}
