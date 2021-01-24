//
//  Sections.swift
//  zCine
//
//  Created by Gabriel Zambelli on 24/08/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation


enum TypeSection {
    case movie
    case serie
}


protocol Section {
    
    var title: String { get }
    var type: TypeSection { get }
    
    func loadDataSection<T: Decodable>(_ type: T.Type, complete: @escaping (Result<[T], ZcineError>) -> Void )
}
