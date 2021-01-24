//
//  UIImage + download.swift
//  zCine
//
//  Created by Gabriel Zambelli on 03/09/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation
import UIKit

typealias completeData = (Data?, URLResponse?, Error?) -> Void

extension UIImageView {
    private func getDataImage(url:URL, complete:@escaping completeData){
        URLSession.shared.dataTask(with: url, completionHandler: complete)
    }
    
    func downloadImage(with path:URL, complete:() -> Void){
        getDataImage(url: path) { (data, response, error) in
            if let _ = error{
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.image = image
            }
            
        }
        
    }
}




