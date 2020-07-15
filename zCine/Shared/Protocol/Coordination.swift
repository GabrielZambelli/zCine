//
//  Coordination.swift
//  moviesIsHere
//
//  Created by Gabriel Zambelli on 13/07/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import UIKit

protocol Coordinatior: class{
    
    var navigationController: UINavigationController {get set}
    var childCoordinators: [Coordinatior] {get set}
    var parentCoordinator: Coordinatior? {get set}
    
    
    func start()
    func add(childCoordinator coordinator: Coordinatior)
    func remove(childCoordinator coordinator: Coordinatior)
    func back()
    func childDidFinish(_ child: Coordinatior?)
    
}

extension Coordinatior{
    
    func add(childCoordinator coordinator: Coordinatior){
        childCoordinators.append(coordinator)
    }
    
    func remove(childCoordinator coordinator: Coordinatior){
        childCoordinators = childCoordinators.filter({$0 !== coordinator})
    }
    func back(){}
    
    func childDidFinish(_ child: Coordinatior?){
        guard let child = child else { return }
        remove(childCoordinator: child)
    }
    
}
