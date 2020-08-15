//
//  LoginCoordinator.swift
//  moviesIsHere
//
//  Created by Gabriel Zambelli on 13/07/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import UIKit

protocol Login{
    func didLogin()
}

class LoginCoordinator: Coordinatior{
    var navigationController: UINavigationController
    var childCoordinators: [Coordinatior] = []
    var parentCoordinator: Coordinatior?
    
    init(_ navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController = LoginViewController.instantiateFromStoryboard(.login)
        loginViewController?.coordinator = self
        
        let loginViewModel = LoginViewModel()
        loginViewModel.delegate = loginViewController
        loginViewController?.loginViewModel = loginViewModel

        if let viewController = loginViewController{
            navigationController.pushViewController(viewController, animated: false)
        }
    }
}

extension LoginCoordinator: Login{
    
    func didLogin() {
        parentCoordinator?.childDidFinish(self)
        parentCoordinator?.start()
    }
}

