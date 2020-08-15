//
//  Storyboard+Name.swift
//  moviesIsHere
//
//  Created by Gabriel Zambelli on 14/07/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import UIKit


extension UIStoryboard{
    static var login: UIStoryboard {
        return UIStoryboard(name: "LoginView", bundle: nil
        )
    }
    
    static var home: UIStoryboard{
        return UIStoryboard(name: "HomeView", bundle: nil)
    }
    
    static var main: UIStoryboard{
        return UIStoryboard(name: "MainView", bundle: nil)
    }
}
