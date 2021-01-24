//
//  HomeViewController.swift
//  zCine
//
//  Created by Gabriel Zambelli on 14/08/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import UIKit

enum IndexSegmentedControl: Int {
    case movies = 0
    case series = 1
}

class HomeViewController: UIViewController {
    
    //MARK: -- Properties
    
    let viewModel: HomeViewModel
    weak var coordinator: Coordinatior?
    
    var index: IndexSegmentedControl?{
        let index = segmentedControl.selectedSegmentIndex
       return IndexSegmentedControl.init(rawValue: index)
    }

    //MARK: -- IBOutlet
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: -- Initializer
    
    required init?(coder: NSCoder, vm: HomeViewModel, coordinator: Coordinatior ){
        self.viewModel = vm
        self.coordinator = coordinator
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: -- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
         //setNeedsStatusBarAppearanceUpdate()
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.white], for: .selected)
        
        //tableView.delegate = self
        tableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numbersRowInSection(index)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        guard let cell = viewModel.cellForRow(at: indexPath.row, index, section) else { return UITableViewCell() }
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return viewModel.numberSection(index)
    }
    
    
}
