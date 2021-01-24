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
        
        let storyboard = UIStoryboard.login
        let service = TmdbApiProvider()
        print(String(describing: storyboard))
        let viewController = storyboard.instantiateViewController(identifier: "LoginViewController", creator: { coder in
            return LoginViewController(coder: coder, coordinator: self, viewModel: LoginViewModel(with:  service))
        })
        
        navigationController.pushViewController(viewController, animated: false)
        
    }
}

extension LoginCoordinator: Login{
    
    func didLogin() {
        parentCoordinator?.childDidFinish(self)
        parentCoordinator?.start()
    }
}

