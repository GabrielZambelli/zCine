//
//  LoginCoordinator.swift
//  moviesIsHere
//
//  Created by Gabriel Zambelli on 13/07/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import UIKit


class LoginCoordinator: Coordinatior{
    var navigationController: UINavigationController
    var childCoordinators: [Coordinatior] = []
    var parentCoordinator: Coordinatior?
    
    init(_ navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController = LoginViewController.instantiateFromStoryboard(.login)
        
        if let viewController = loginViewController{
            navigationController.pushViewController(viewController, animated: false)
        }
    }
    
    
}

