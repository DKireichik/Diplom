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
        return productBasketArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketTableViewCell", for: indexPath)
        guard let basketCell = cell as? BasketFavoritesTableViewCell else {return cell}
        let basketProduct =  dataManager.obtainStep()[indexPath.row]
        basketCell.image.image = UIImage(named: "\(basketProduct.image)")
        basketCell.labelImage.text = basketProduct.name
        basketCell.price.text = "\(basketProduct.price)"+" руб"
        basketCell.countProduct.text = "\(productBasketArray[indexPath.row].count)"
        basketCell.deleteBasketButton = { [weak self] in
            let productBasketFiltered = productBasketArray.filter({$0.name != basketProduct.name })
            productBasketArray = productBasketFiltered
            self?.dataManager.saveStep(productBasketArray)
            tableView.reloadData()
        }
        basketCell.plusProductButton = { 
            if let index = productBasketArray.firstIndex(where: {$0.name == basketProduct.name }) {
               productBasketArray[index].count = productBasketArray[index].count + 1
            }
            basketCell.countProduct.text = "\(productBasketArray[indexPath.row].count)"
            tableView.reloadData()
        }
        basketCell.minusProductButton = {
            if productBasketArray[indexPath.row].count > 1 {
                if let index = productBasketArray.firstIndex(where: {$0.name == basketProduct.name }) {
                   productBasketArray[index].count = productBasketArray[index].count - 1
                }
                basketCell.countProduct.text = "\(productBasketArray[indexPath.row].count)"
                tableView.reloadData()
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = BasketTableFooterView()
        footer.backgroundColor = .white
        var resultSum = 0.0
        productBasketArray.forEach { item in
            resultSum += (item.price * Double(item.count))
        }
        footer.sum.text = "Итого: "+"\(resultSum.rounded(toPlaces: 2))"+" руб"
        footer.orderBasketButton = { [weak self] in
            self?.present(PaymentCardViewController(), animated: true)
            productBasketArray = []
            footer.name.text = ""
            footer.address.text = ""
            footer.numberPhone.text = ""
            tableView.reloadData()
        }
        return footer
    }
}
