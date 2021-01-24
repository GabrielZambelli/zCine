//
//  CircleCollectionViewCell.swift
//  zCine
//
//  Created by Gabriel Zambelli on 31/08/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import UIKit

class CircleCollectionViewCell: UICollectionViewCell {

    //MARK: -- Properties
    
    //MARK: -- Outlets
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var viewCell: CircleCollectionViewCell!
    
    //MARK: Lyfe cycle view
    override func awakeFromNib() {
        super.awakeFromNib()
        cornerRadiusCell()
        // Initialization code
    }
    
    //MARK: Methods
    
    override func prepareForReuse() {
        title.text = ""
    }
    
//    func showImage(with path: URL){
//        activityIndicator.startAnimating()
//
//
//        imageCircle.downloadImage(with: path) { [weak self] in
//            guard let self = self else { return }
//            self.activityIndicator.stopAnimating()
//        }
//
//    }
    
//    func showImage(with image:UIImage){
//        self.imageCircle.image = image
//    }
    
    
    //MARK: Private Methods
    
    private func cornerRadiusCell(){
        viewCell.layer.cornerRadius = viewCell.frame.width/2
        viewCell.clipsToBounds = true
    }

}
