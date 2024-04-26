//
//  ProductCollectionViewController.swift
//  Oz.by
//
//  Created by Darya on 24.04.24.
//

import UIKit

class ProductListController: UIViewController {

    let produtListView = ProductListView()
    let collectionViewCell = CollectionViewCellProduct()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.addSubview(produtListView)
        produtListView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            produtListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            produtListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            produtListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            produtListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
            
        ])
        navigationController?.isNavigationBarHidden = false

    }
}
    
