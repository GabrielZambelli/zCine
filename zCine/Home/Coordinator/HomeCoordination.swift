//
//  HomeCoordination.swift
//  zCine
//
//  Created by Gabriel Zambelli on 14/08/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation
import UIKit


class HomeCoordinatior: Coordinatior{
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinatior] = []
    var parentCoordinator: Coordinatior?
    
    init (_ nc: UINavigationController = UINavigationController()){
        self.navigationController = nc
    }
    
    func start() {
        
    }
    
    
}
