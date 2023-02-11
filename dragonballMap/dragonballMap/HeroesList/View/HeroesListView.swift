//
//  HeroesListView.swift
//  dragonballMap
//
//  Created by Markel Juaristi on 11/2/23.
//

import Foundation
import UIKit

class HeroesListView: UIView {
    //CREATE HEADER
    let headerLabel = {
        let label = UILabel()
        label.text = "MVC"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        //label.backgroundColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false /* muy importante siempre a false!!!*/
        return label
    }()
    
    //CREATE TABLE VIEWS
    let heroesTableView = {
        let tableView = UITableView()
        
        tableView.register(HeroListViewCell.self, forCellReuseIdentifier: "HeroesListViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //tableView.backgroundColor = .green
        
        return tableView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //   CREATE /ADD MY SUBLIST
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        backgroundColor = .white
        
        addSubview(headerLabel)
        addSubview(heroesTableView)
        
        
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant:  60),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  16),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            headerLabel.heightAnchor.constraint(equalToConstant: 50),
            
            //heroesTableView.topAnchor.constraint(equalTo: headerLabel.topAnchor, constant: 50),
            heroesTableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
            heroesTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            heroesTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            heroesTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
        
        ])
    }
}

