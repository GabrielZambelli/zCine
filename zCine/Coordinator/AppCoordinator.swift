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
        
        if let session = KeychainHelper.shared.getSession(), let token = session.token {

            if(!session.success){
                 drawLogin()
            }else
            {
                drawMain()
            }
//            if(!token.isExpired()){
//                drawLogin()
//            } else{
//                drawMain()
//            }
        }
        else{
           drawLogin()
        }
    }
    
    private func drawLogin(){
        let childCoordinator = LoginCoordinator(self.navigationController)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.start()
    }
    
    private func drawMain(){
        let childCoordinator = MainCoordinator(nc: self.navigationController)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.start()
        
    }
}
