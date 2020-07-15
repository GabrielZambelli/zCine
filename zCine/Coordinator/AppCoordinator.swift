//
//  AppCoordinator.swift
//  moviesIsHere
//
//  Created by Gabriel Zambelli on 13/07/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinatior{
    var navigationController: UINavigationController
    var childCoordinators: [Coordinatior] = []
    var parentCoordinator: Coordinatior?
    
    init(){
        navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = false
        navigationController.isNavigationBarHidden = true
    }
    
    func start() {
        let childCoordinator = LoginCoordinator(self.navigationController)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.start()
    }
}
