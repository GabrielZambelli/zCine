//
//  GenerosSection.swift
//  zCine
//
//  Created by Gabriel Zambelli on 31/08/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation
import UIKit


protocol GenreDelegate {
    func didSelectItem(in index:Int)
}

class GenreSection{
    
    //MARK: Properties
    private var listGenre:[Genre]?
    private var typeGenreSection:TypeSection
    private let service: TmdbApiProvider
    private let delegate: GenreDelegate
    
    var viewGenre: CircleTableViewCell
    
    
    //MARK: Life cicly
    
    init(service: TmdbApiProvider, type: TypeSection = .movie, delegate:GenreDelegate){
        self.service = service
        self.typeGenreSection = type
        self.delegate = delegate
        
        viewGenre = CircleTableViewCell()
        viewGenre.awakeFromNib()
        viewGenre.source = self
    }
}

extension GenreSection: Section{
   
    var nameSection: String {
        return "Gêneros"
    }
    
    var type: TypeSection {
        return self.typeGenreSection
        
    }
    
    func loadDataSection() {
        service.fetchGenre(type: typeGenreSection) { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let genres):
                self.listGenre?.append(contentsOf: genres)
                self.reloadView()
                break
            case .failure(let error):
                //to do
                break
            }
        }
    }
    
    func makeView() -> UITableViewCell? {
        
        guard let genre = listGenre else { return nil }
        if genre.count > 0 {
            return viewGenre
        }
        else { return nil }
    }
    
    func reloadView(){
        viewGenre.reloadCollection()
    }
    
}

extension GenreSection: CircleCollectionSource{
    func getTitle(with index: Int) -> String? {
        
        guard let genres = listGenre else { return nil}
        
        if genres.count > index{
            return genres[index].name
        }
        else{
           return nil
        }
    }
    
    func numberOfItemsInSection() -> Int {
        return self.listGenre?.count ?? 0
    }
}

extension GenreSection: CircleCollectionDelegate{
    func didSelectItem(in index: Int) {
        delegate.didSelectItem(in: index)
    }
}

//MARK: -- Código

//    func getImageUrl(with index: Int) -> URL? {
//        return nil
//    }
//
//    func getImage(with index: Int) -> UIImage? {
//        guard let genres = listGenre else { return nil }
//
//        if genres.count >= index{
//            if let data = genres[index].image{
//                let image = UIImage(data: data)
//                return image
//            }
//        }
//        return nil
//    }
