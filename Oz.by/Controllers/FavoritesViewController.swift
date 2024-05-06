//
//  FavoritesViewController.swift
//  Diplom
//
//  Created by Darya on 16.04.24.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
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
        tableView.register(BasketFavoritesTableViewCell.self, forCellReuseIdentifier: "FavoritesTableViewCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productFavorites.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath)
        guard let favoritesCell = cell as? BasketFavoritesTableViewCell else { return cell }
        let favoritesProduct =  dataManager.obtainStepFavorites()[indexPath.row]
        favoritesCell.image.image = UIImage(named: "\(favoritesProduct.image)")
        favoritesCell.labelImage.text = favoritesProduct.name
        favoritesCell.price.text = "\(favoritesProduct.price)"+" руб"
        favoritesCell.plusButton.isHidden = true
        favoritesCell.minusButton.isHidden = true
        favoritesCell.countProduct.isHidden = true
        favoritesCell.deleteBasketButton = {
            let productBasketFiltered = productFavorites.filter({$0.name != favoritesProduct.name })
            productFavorites = productBasketFiltered
            self.dataManager.saveStepFavorites(productFavorites)
            tableView.reloadData()
        }
        return cell
    }
}
