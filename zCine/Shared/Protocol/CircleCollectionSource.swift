//
//  CircleCollectionSource.swift
//  zCine
//
//  Created by Gabriel Zambelli on 04/09/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation
import UIKit

protocol CircleCollectionSource {
  
    func getTitle(with Index: Int) -> String?
    func numberOfItemsInSection () -> Int
//    func getImageUrl(with index: Int) -> URL?
//    func getImage(with index: Int) -> UIImage?
  
}
