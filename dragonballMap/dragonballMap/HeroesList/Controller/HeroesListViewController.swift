//
//  HeroesListViewController.swift
//  dragonballMap
//
//  Created by Markel Juaristi on 11/2/23.
//

import Foundation
import UIKit

class HeroesListViewController : UIViewController {
    var mainView: HeroesListView { self.view as! HeroesListView}
    var heroes:  [HeroModel] = []
    
    var viewModel : HeroListViewModel?
    
    var tableViewDataSource: HeroesListTableViewDataSource?
    var tableViewDelegate : HeroesListTableViewDelegate?
    
    override func loadView(){
        
        view = HeroesListView()
        
        tableViewDataSource = HeroesListTableViewDataSource(tableView: mainView.heroesTableView)
        mainView.heroesTableView.dataSource = tableViewDataSource
        
        
        tableViewDelegate = HeroesListTableViewDelegate()
        mainView.heroesTableView.delegate = tableViewDelegate
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = HeroListViewModel()
        //PREPARANDOME PARA RECIBIR LOS DATOS QUE VIENE DEL VIEWMODEL
        viewModel?.updateUI = { [weak self] heroes in
            self?.heroes = heroes
            self?.tableViewDataSource?.heroes = heroes
        }
        
        getData()
        setUpTableDelegate()
        
       
            
        }
        
        
        
        func getData(){
            /* traer los datos: CALL API TO GET HERO LIST*/
            viewModel?.fetchData()
        }
    
        func setUpTableDelegate(){
            tableViewDelegate?.didTapOnCell = { [weak self] index in
                guard let datasource = self?.tableViewDataSource else {
                    return
                }
                //Get the hero in the hero list according to thew position index
                let hero =  datasource.heroes[index]
                
                // prepare the viewcontroller that I want to present
                let heroDetailViewController = HeroDetailViewController(heroDetailModel: hero)
                
                //present the controller to show the details
                
                self?.present(heroDetailViewController,animated: true)
                
            }
    }
    
   
}
