//
//  GenerosSection.swift
//  zCine
//
//  Created by Gabriel Zambelli on 31/08/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation
import UIKit


class GenreSection{
    
    
    
}

extension GenreSection: Section{
    var title: String {
        return "Gêneros"
    }
    
    var type: TypeSection {
        return .movie
    }
    
    func loadDataSection() {
        <#code#>
    }
    
    func makeView(with index: Int) -> UITableViewCell {
        
    }
}

extension GenreSection: Circle
