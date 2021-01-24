//
//  ViewController.swift
//  zCine
//
//  Created by Gabriel Zambelli on 12/08/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    //MARK: -- Atributes
    
    var coordinator: Coordinatior
    
    required init?(coder: NSCoder, coordinator: Coordinatior) {
        self.coordinator = coordinator
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
