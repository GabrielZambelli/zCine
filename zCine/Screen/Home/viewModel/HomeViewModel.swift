//
//  HomeViewModel.swift
//  zCine
//
//  Created by Gabriel Zambelli on 22/08/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import Foundation
import UIKit

class HomeViewModel {
    
    //MARK: -- Properties
    
    let  listMoviesSection:[Section]
    let  listSeriesSection:[Section]
    
    //MARK: -- Init
    init(with moviesSection:[Section], _ seriesSection:[Section]){
        self.listMoviesSection = moviesSection
        self.listSeriesSection = seriesSection
    }
    
    //MARK: -- Methods
    
    func numbersRowInSection(_ index: IndexSegmentedControl?) -> Int{
        guard let indexSegmented = index else { return 0 }
     
        switch indexSegmented {
        case .movies:
            return 1
        case .series:
            return 1
        }
    }
    
    func numberSection(_ index: IndexSegmentedControl?) -> Int{
        guard let indexSegmented = index else {return 0}
        
        switch indexSegmented {
        case .movies:
            return listMoviesSection.count
        case .series:
            return listSeriesSection.count
        }
    }
    
    func cellForRow(at indexPath: Int, _ indexSegmented: IndexSegmentedControl?, _ section: Int) -> UITableViewCell?{
        
        guard let indexSegmented = indexSegmented else { return nil }
        
        switch indexSegmented {
        case .movies:
            if(section <= listMoviesSection.count){
                let section = listMoviesSection[section]
                guard let cell = section.makeView() else { return  nil }
                return cell
            }
            return nil
        case .series:
            if(section <= listSeriesSection.count){
                let section = listSeriesSection[section]
                guard let cell = section.makeView() else { return  nil }
                
                return cell
            }
            return nil
        }
    }
    
    
}
