//
//  Sections.swift
//  zCine
//
//  Created by Gabriel Zambelli on 24/08/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation
import UIKit


enum TypeSection {
    case movie
    case serie
}


protocol Section {
    
    var nameSection: String { get }
    var type: TypeSection { get }
    
    func loadDataSection()
    
    func makeView() -> UITableViewCell?
}
