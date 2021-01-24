//
//  GenreTableViewCell.swift
//  zCine
//
//  Created by Gabriel Zambelli on 31/08/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import UIKit

protocol CircleCollectionDelegate {
    func didSelectItem(in index: Int)
}


class CircleTableViewCell: UITableViewCell {
    
    //MARK: -- Properties
    var source: CircleCollectionSource?
    var delegate: CircleCollectionDelegate?
    
    
    //MARK: -- Outlet
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CircleCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "circleCollectionCell")
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func reloadCollection(){
        collectionView.reloadData()
    }

}
extension CircleTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return source?.numberOfItemsInSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "circleCollectionCell", for: indexPath) as? CircleCollectionViewCell{
            
            collectionCell.tag = indexPath.row
            collectionCell.title.text = source?.getTitle(with: indexPath.row)
            
//            if let image = source?.getImage() {
//                collectionCell.showImage(with: image)
//            }
//            else if let url = source?.getImageUrl(){
//                collectionCell.showImage(with: url)
//            }
            //to do imagens que nao podem ser carregadas
            return collectionCell
            
        }else{
            return UICollectionViewCell()
        }
    }
}



extension CircleTableViewCell:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.row
        delegate?.didSelectItem(in: index)
    }
}

