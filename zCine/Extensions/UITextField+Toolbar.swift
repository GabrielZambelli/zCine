//
//  UITextField+Toolbar.swift
//  zCine
//
//  Created by Gabriel Zambelli on 15/07/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import UIKit


extension UITextField{
    
    func addHideKeyboard(selector: Selector){
        
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.size.width, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let barButton = UIBarButtonItem(image: UIImage(systemName: "keyboard.chevron.compact.down"), style: .plain, target: nil, action: selector)

        toolBar.setItems([flexible, barButton], animated: false)
        self.inputAccessoryView = toolBar
    }
}

