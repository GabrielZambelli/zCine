//
//  SearchCoordinator.swift
//  zCine
//
//  Created by Gabriel Zambelli on 15/08/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation
import UIKit

class SearchCoordinator: Coordinatior{
    
    //MARK: -- Properties
    var navigationController: UINavigationController
    var childCoordinators: [Coordinatior] = []
    var parentCoordinator: Coordinatior?
    
    
    //MARK: -- Init
    init(nc: UINavigationController = UINavigationController()){
        self.navigationController = nc
    }
    
    //MARK: -- Methods
    
    func start() {
        
    }
    
    
}
