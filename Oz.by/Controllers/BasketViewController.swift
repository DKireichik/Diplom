//
//  BasketViewController.swift
//  Diplom
//
//  Created by Darya on 16.04.24.
//

import UIKit

class BasketViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tableView = UITableView()

    lazy var dataManager = DataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = TableViewCell()
        let basketProduct =  dataManager.obtainStep()[indexPath.row]
        cell.image.image = UIImage(named: "\(basketProduct.image)")
        cell.labelImage.text = basketProduct.name
        cell.price.text = "\(basketProduct.price)"+" руб"
        cell.deleteBasketButton = { 
            tableView.reloadData()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.obtainStep().count
    }
    

}

