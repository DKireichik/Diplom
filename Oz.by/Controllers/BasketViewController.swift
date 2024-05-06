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
        tableView.register(BasketFavoritesTableViewCell.self, forCellReuseIdentifier: "BasketTableViewCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productBasket.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketTableViewCell", for: indexPath)
        guard let basketCell = cell as? BasketFavoritesTableViewCell else {return cell}
        let basketProduct =  dataManager.obtainStep()[indexPath.row]
        basketCell.image.image = UIImage(named: "\(basketProduct.image)")
        basketCell.labelImage.text = basketProduct.name
        basketCell.price.text = "\(basketProduct.price)"+" руб"
        basketCell.deleteBasketButton = {
            let productBasketFiltered = productBasket.filter({$0.name != basketProduct.name })
            productBasket = productBasketFiltered
            self.dataManager.saveStep(productBasket)
            tableView.reloadData()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = BasketTableFooterView()
        var resultSum = 0.0
        productBasket.forEach { item in
            resultSum += item.price
        }
        footer.sum.text = "Итого: "+"\(resultSum)"+" руб"
        footer.orderBasketButton = { [self] in
            present(PaymentCardViewController(), animated: true)
            productBasket = []
            tableView.reloadData()
        }
        return footer
    }
}
