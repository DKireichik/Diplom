//
//  ProductViewController.swift
//  Oz.by
//
//  Created by Darya on 24.04.24.
//

import UIKit

class ProductViewController: UIViewController {
    var imageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    var labelImage = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var productAvailability = {
        let productAvailability = UILabel()
        productAvailability.textColor = .lightGray
        productAvailability.translatesAutoresizingMaskIntoConstraints = false
        return productAvailability
    }()
    var price = {
        let price = UILabel()
        price.font = UIFont.boldSystemFont(ofSize: 24)
        price.textColor = .white
        price.layer.cornerRadius = 5
        price.layer.masksToBounds = true
        price.backgroundColor = .orange
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()
    lazy var basketButton: UIButton = {
        let basketButton = UIButton(type: .system)
        basketButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        basketButton.setImage(UIImage(systemName: "cart"), for: .normal)
        basketButton.setTitle("Добавить в корзину", for: .normal)
        basketButton.translatesAutoresizingMaskIntoConstraints = false
        basketButton.layer.cornerRadius = 5
        basketButton.tintColor = .white
        basketButton.backgroundColor = .orange
        basketButton.addTarget(self, action: #selector(addToBasket), for: .touchUpInside)
        return basketButton
    }()
    lazy var  favoritesButton: UIButton = {
        let favoritesButton = UIButton(type: .system)
        favoritesButton.setImage(UIImage(systemName: "heart"), for: .normal)
        favoritesButton.translatesAutoresizingMaskIntoConstraints = false
        favoritesButton.tintColor = .black
        favoritesButton.addTarget(self, action: #selector(addTofavorites), for: .touchUpInside)
        return favoritesButton
    }()
    lazy var data = DataManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.addSubview(labelImage)
        view.addSubview(price)
        view.addSubview(basketButton)
        view.addSubview(productAvailability)
        view.addSubview(favoritesButton)
        checkIsItemExistBasket()
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -250),
            favoritesButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            favoritesButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            labelImage.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            labelImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            labelImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            productAvailability.topAnchor.constraint(equalTo: labelImage.bottomAnchor, constant: 10),
            productAvailability.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            price.topAnchor.constraint(equalTo: productAvailability.bottomAnchor, constant: 15),
            price.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            price.heightAnchor.constraint(equalToConstant: 45),
            price.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30),
            basketButton.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 8),
            basketButton.heightAnchor.constraint(equalToConstant: 60),
            basketButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            basketButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }
    @objc func addToBasket (_ sender: UIButton) {
        let product  = Source.makeProduct().filter { $0.name == labelImage.text}
        productBasket.append(product[0])
        data.saveStep(productBasket)
    }
    @objc func addTofavorites (_ sender: UIButton) {
        let product  = Source.makeProduct().filter { $0.name == labelImage.text}
        productFavorites.append(product[0])
        data.saveStepFavorites(productFavorites)
        favoritesButton.tintColor = .red
    }
    func checkIsItemExistBasket() {
        let isExist = productBasket.filter{ $0.name == labelImage.text}
        if isExist.count > 0 {
            basketButton.setTitle("Товар уже в корзине", for: .normal)
        }
    }
}
