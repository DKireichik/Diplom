//
//  BasketFavoritesTableViewCell.swift
//  Oz.by
//
//  Created by Darya on 19.04.24.
//

import UIKit

class BasketFavoritesTableViewCell: UITableViewCell {
    let image = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let labelImage = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let price = {
        let price = UILabel()
        price.textColor = .orange
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()
    lazy var basketButton: UIButton = {
        let basketButton = UIButton(type: .system)
        basketButton.setImage(UIImage(systemName: "trash"), for: .normal)
        basketButton.translatesAutoresizingMaskIntoConstraints = false
        basketButton.tintColor = .gray
        basketButton.addTarget(self, action: #selector(deleteBasket), for: .touchUpInside)
        return basketButton
    }()
    lazy var plusButton: UIButton = {
        let plusButton = UIButton(type: .system)
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.tintColor = .black
        plusButton.addTarget(self, action: #selector(plusBasketButton), for: .touchUpInside)
        return plusButton
    }()
    lazy var minusButton: UIButton = {
        let minusButton = UIButton(type: .system)
        minusButton.setImage(UIImage(systemName: "minus"), for: .normal)
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.tintColor = .black
        minusButton.addTarget(self, action: #selector(minusBasketButton), for: .touchUpInside)
        return minusButton
    }()
    let countProduct = {
        let countProduct = UILabel()
        countProduct.textAlignment = .center
        countProduct.textColor = .orange
        countProduct.text = "1"
        countProduct.layer.borderColor = UIColor.gray.cgColor
        countProduct.layer.borderWidth = 0.5
        countProduct.translatesAutoresizingMaskIntoConstraints = false
        return countProduct
    }()
    var deleteBasketButton: (() -> Void)?
    var plusProductButton: (() -> Void)?
    var minusProductButton: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(image)
        contentView.addSubview(labelImage)
        contentView.addSubview(price)
        contentView.addSubview(basketButton)
        contentView.addSubview(minusButton)
        contentView.addSubview(plusButton)
        contentView.addSubview(countProduct)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            image.heightAnchor.constraint(equalToConstant: 90),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -300),
            labelImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            labelImage.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12),
            price.topAnchor.constraint(equalTo: labelImage.bottomAnchor, constant: 5),
            price.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12),
            basketButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            basketButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            minusButton.centerYAnchor.constraint(equalTo: countProduct.centerYAnchor),
            minusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            countProduct.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            countProduct.trailingAnchor.constraint(equalTo: minusButton.leadingAnchor, constant: -10),
            countProduct.heightAnchor.constraint(equalToConstant: 30),
            countProduct.widthAnchor.constraint(equalToConstant: 30),
            plusButton.centerYAnchor.constraint(equalTo: countProduct.centerYAnchor),
            plusButton.trailingAnchor.constraint(equalTo: countProduct.leadingAnchor, constant: -10)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func deleteBasket (_ sender: UIButton) {
        deleteBasketButton?()
    }
    @objc func plusBasketButton (_ sender: UIButton) {
        plusProductButton?()
    }
    @objc func minusBasketButton (_ sender: UIButton) {
        minusProductButton?()
    }
}
