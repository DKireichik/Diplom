//
//  HomeCollec.swift
//  Diplom
//
//  Created by Darya on 17.04.24.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    static let id = "ProductCollectionViewCell"
    
    let imageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelImageProduct = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let productAvailability = {
        let productAvailability = UILabel()
        productAvailability.textColor = .lightGray
        productAvailability.translatesAutoresizingMaskIntoConstraints = false
        return productAvailability
    }()
    let price = {
        let price = UILabel()
        price.textColor = .orange
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()
    lazy var  basketButton: UIButton = {
        let basketButton = UIButton(type: .system)
        basketButton.setImage(UIImage(systemName: "cart"), for: .normal)
        basketButton.translatesAutoresizingMaskIntoConstraints = false
        basketButton.tintColor = .orange
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
    var addToBasketButton: (() -> Void)?
    var addTofavoritesButton: (() -> Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(labelImageProduct)
        contentView.addSubview(price)
        contentView.addSubview(basketButton)
        contentView.addSubview(productAvailability)
        contentView.addSubview(favoritesButton)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo:  contentView.topAnchor,constant: 20),
            imageView.trailingAnchor.constraint(equalTo:  contentView.trailingAnchor,constant: -20),
            imageView.leadingAnchor.constraint(equalTo:  contentView.leadingAnchor,constant: 20),
            imageView.bottomAnchor.constraint(equalTo:  contentView.bottomAnchor,constant: -80),
            favoritesButton.topAnchor.constraint(equalTo:  contentView.topAnchor,constant: 5),
            favoritesButton.trailingAnchor.constraint(equalTo:  contentView.trailingAnchor,constant: -5),
            favoritesButton.heightAnchor.constraint(equalToConstant: 30),
            labelImageProduct.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            labelImageProduct.leadingAnchor.constraint(equalTo:  contentView.leadingAnchor),
            labelImageProduct.trailingAnchor.constraint(equalTo:  contentView.trailingAnchor),
            price.topAnchor.constraint(equalTo: labelImageProduct.bottomAnchor, constant: 5),
            price.leadingAnchor.constraint(equalTo:  contentView.leadingAnchor),
            price.trailingAnchor.constraint(equalTo:  contentView.trailingAnchor),
            productAvailability.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 5),
            productAvailability.leadingAnchor.constraint(equalTo:  contentView.leadingAnchor),
            basketButton.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 5),
            basketButton.trailingAnchor.constraint(equalTo:  contentView.trailingAnchor, constant: -8),
        ])
    }
    @objc func addToBasket (_ sender : UIButton) {
       addToBasketButton?()
    }
    @objc func addTofavorites (_ sender : UIButton) {
       addTofavoritesButton?()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
