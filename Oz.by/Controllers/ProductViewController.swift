//
//  ProductViewController.swift
//  Oz.by
//
//  Created by Darya on 24.04.24.
//

import UIKit

class ProductViewController: UIViewController {
    
    let produtView = ProductView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(produtView)
        produtView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            produtView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            produtView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            produtView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            produtView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
            
        ])
        
    }
    
}
