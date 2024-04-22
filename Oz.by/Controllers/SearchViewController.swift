//
//  SearchViewController.swift
//  Diplom
//
//  Created by Darya on 16.04.24.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let goods  = [ Product(name: "Томас Маан", price: 10.5, productAvailability: true, image: .book, type: .books),
                   Product(name: "Аллан Гай", price: 17.3, productAvailability: true, image: .book, type: .books),
                   Product(name: "Уве", price: 13.9, productAvailability: false, image: .book, type: .books),
                   Product(name: "Титаник", price: 25.6, productAvailability: true, image: .book, type: .books),
                   Product(name: "Карандаш", price: 1.9, productAvailability: true, image: .book, type: .souvenirs),
                   Product(name: "Ваза", price: 15.4, productAvailability: true, image: .book, type: .souvenirs),
                   Product(name: "Уно", price: 20.5, productAvailability: true, image: .book, type: .games),
                   Product(name: "Бункер", price: 103.6, productAvailability: true, image: .book, type: .games),
                   Product(name: "Где мой кот", price: 12.61, productAvailability: true, image: .book, type: .games),]
    
    var tableView = UITableView()
    
    private var filteredShop = [Product]()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else {return false}
        return text.isEmpty
    }
    private var isFiltering : Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "ВВедите название товара"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
      
        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SearchTableViewCell()
        let goods = goods[indexPath.row]
        cell.textLabel?.text = "\(goods.type)"
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredShop.count
        }
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}



extension SearchViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    private func filterContentForSearchText (_ searchText : String) {
        filteredShop = storeGoods.goods.filter({ (book : Product) in
            return book.name.lowercased().contains(searchText.lowercased())
        })
    }
    
}


