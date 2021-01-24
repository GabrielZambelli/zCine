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
        navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func start() {
        
        let moviesSection:[Section] = []
        let seriesSection:[Section] = []
        
        let homeViewModel = HomeViewModel(with: moviesSection, seriesSection)
        
        let storyboard = UIStoryboard.home
        let viewController = storyboard.instantiateViewController(identifier: "HomeViewController") { coder in
            return HomeViewController(coder: coder, vm: homeViewModel, coordinator: self)
        }
        navigationController.pushViewController(viewController, animated: true)
    }
    
    
}
