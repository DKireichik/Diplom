//
//  SearchViewController.swift
//  Diplom
//
//  Created by Darya on 16.04.24.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let goods = Source.makeProduct()
    var tableView = UITableView()
    private let searchController  = UISearchController(searchResultsController: nil)
    private var filteredShop = [ProductItem]()
    var searching  = false
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else {return false}
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Введите название товара"
        navigationItem.titleView = searchController.searchBar
        definesPresentationContext = false
        navigationItem.hidesSearchBarWhenScrolling = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isFiltering {
            let cell = SearchTableViewCell()
            cell.image.image = filteredShop[indexPath.row].image
            cell.labelImage.text = filteredShop[indexPath.row].name
            cell.price.text = "\(filteredShop[indexPath.row].price)"+" руб"
            cell.productAvailability.text = filteredShop[indexPath.row].productAvailability
            return cell
        } else {
            let cell = SearchViewCell()
            cell.image.image = SearchList.searchList()[indexPath.row].image
            cell.labelImage.text = SearchList.searchList()[indexPath.row].name
            return cell
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredShop.count
        } else {
            return 3
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isFiltering {
            let productVC = ProductViewController()
            productVC.produtView.imageView.image = filteredShop[indexPath.row].image
            productVC.produtView.labelImage.text = filteredShop[indexPath.row].name
            productVC.produtView.productAvailability.text = filteredShop[indexPath.row].productAvailability
            productVC.produtView.price.text = "\(filteredShop[indexPath.row].price)"+" руб"
            productVC.title = filteredShop[indexPath.row].name
            navigationController?.pushViewController(productVC, animated: true)
        } else {
            let productListVC = ProductListController()
            productListVC.collectionViewCell.imageView.image = Source.MakeProductWothGroup()[indexPath.row][indexPath.row].image
            productListVC.collectionViewCell.labelImageProduct.text = Source.MakeProductWothGroup()[indexPath.row][indexPath.row].name
            productListVC.collectionViewCell.price.text = "\(Source.MakeProductWothGroup()[indexPath.row][indexPath.row].price)"+" руб"
            productListVC.collectionViewCell.productAvailability.text = Source.MakeProductWothGroup()[indexPath.row][indexPath.row].productAvailability
            navigationController?.pushViewController(productListVC, animated: true)
        }
    }
}
extension SearchViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContext(searchController.searchBar.text!)
    }
    private func filterContext (_ searchText : String ) {
        filteredShop = goods.filter({ (goods: ProductItem) -> Bool in
            return goods.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
