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
    
    var deleteBasketButton: (() -> Void)?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(image)
        contentView.addSubview(labelImage)
        contentView.addSubview(price)
        contentView.addSubview(basketButton)
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
            basketButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func deleteBasket (_ sender: UIButton) {
        deleteBasketButton?()
    }
}
