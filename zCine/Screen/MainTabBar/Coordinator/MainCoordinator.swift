//
//  MainCoordinator.swift
//  zCine
//
//  Created by Gabriel Zambelli on 12/08/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation
import UIKit


class MainCoordinator: Coordinatior{
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinatior] = []
    var parentCoordinator: Coordinatior?
    
    func start() {
        let storyboard = UIStoryboard.main
        let tabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController", creator: { coder in
            return MainTabBarController(coder: coder, coordinator: self)
        })
        
        tabBarController.viewControllers = [
            initHome(),
            initSearch(),
            initProfile()
        ]
        
        navigationController.pushViewController(tabBarController, animated: false)
    }
    
    init(nc: UINavigationController){
        self.navigationController = nc
    }
    
    private func initHome() -> UIViewController{
        
        let childCoordinator = HomeCoordinatior()
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        
        childCoordinator.navigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house" ), selectedImage: UIImage(systemName: "house.fill"))
        
        childCoordinator.start()
        return childCoordinator.navigationController
    }
    
    private func initSearch() -> UIViewController {
        
        let childCoordinator = SearchCoordinator()
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        
        childCoordinator.navigationController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass.circle"), selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
       
        childCoordinator.start()
        return childCoordinator.navigationController
        
    }
    
    private func initProfile() -> UIViewController{
        let childCoordinator = ProfileCoordinator()
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        
        childCoordinator.navigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person.circle.fill"))
        
        
        childCoordinator.start()
        return childCoordinator.navigationController
    }
    
    
}
