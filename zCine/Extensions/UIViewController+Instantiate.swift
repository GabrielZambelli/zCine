//
//  UIViewController+Instantiate.swift
//  moviesIsHere
//
//  Created by Gabriel Zambelli on 14/07/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import UIKit

extension UIViewController{
    static func instantiateFromStoryboard(_ storyboard: UIStoryboard) -> Self? {
        let nameStoryboard = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: nameStoryboard) as? Self
    }
}


