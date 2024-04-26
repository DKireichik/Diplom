//
//  ProductView.swift
//  Oz.by
//
//  Created by Darya on 25.04.24.
//

import UIKit

class ProductView: UIView {
    
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
    let basketButton: UIButton = {
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
    var addToBasketButton: (() -> Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(labelImage)
        addSubview(price)
        addSubview(basketButton)
        addSubview(productAvailability)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo:  safeAreaLayoutGuide.topAnchor,constant: 20),
            imageView.trailingAnchor.constraint(equalTo:  safeAreaLayoutGuide.trailingAnchor,constant: -50),
            imageView.leadingAnchor.constraint(equalTo:  safeAreaLayoutGuide.leadingAnchor,constant: 50),
            imageView.bottomAnchor.constraint(equalTo:  bottomAnchor,constant: -220),
            labelImage.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            labelImage.leadingAnchor.constraint(equalTo:  safeAreaLayoutGuide.leadingAnchor,constant: 15),
            labelImage.trailingAnchor.constraint(equalTo:  safeAreaLayoutGuide.trailingAnchor),
            productAvailability.topAnchor.constraint(equalTo: labelImage.bottomAnchor, constant: 10),
            productAvailability.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 15),
            price.topAnchor.constraint(equalTo: productAvailability.bottomAnchor, constant: 15),
            price.centerXAnchor.constraint(equalTo: centerXAnchor),
            price.heightAnchor.constraint(equalToConstant: 45),
            price.widthAnchor.constraint(equalTo: widthAnchor, constant: -30),
            basketButton.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 8),
            basketButton.heightAnchor.constraint(equalToConstant: 60),
            basketButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15),
            basketButton.trailingAnchor.constraint(equalTo:  trailingAnchor,constant: -15),
        ])
        
        
    }
    @objc func addToBasket (_ sender : UIButton) {
        addToBasketButton?()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
