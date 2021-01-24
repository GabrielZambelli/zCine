//
//  GenreEndPoint.swift
//  zCine
//
//  Created by Gabriel Zambelli on 07/09/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation


extension TmdbApiProvider{
    func fetchGenre(type: TypeSection, complete: @escaping (Result<[Genre], ZcineError>) -> Void){
        
        let parameter = ["api_key":self.getApiKey()]
        let endPoint = (type == TypeSection.movie) ? TmdbApiEndPoint.GenresMovies: TmdbApiEndPoint.GenresSeries
        
        request([Genre].self, endPoint: endPoint, parameters: parameter) { (result) in
            
            switch result {
            case .success(let genre):
                complete(.success(genre))
                break
            case .failure(let error):
                complete(.failure(error))
                break
            }
            
        }
    }
}
