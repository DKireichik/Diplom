//
//  HomeCollec.swift
//  Diplom
//
//  Created by Darya on 17.04.24.
//

import UIKit

class CollectionViewCellProduct: UICollectionViewCell {
    
 
    
    static let id = "CollectionViewCellProduct"
    
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
    let basketButton: UIButton = {
        let basketButton = UIButton(type: .system)
        basketButton.setImage(UIImage(systemName: "cart"), for: .normal)
        basketButton.translatesAutoresizingMaskIntoConstraints = false
        basketButton.tintColor = .orange
        basketButton.addTarget(CollectionViewCellProduct.self, action: #selector(addToBasket), for: .touchUpInside)
        return basketButton
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(labelImageProduct)
        contentView.addSubview(price)
        contentView.addSubview(basketButton)
        contentView.addSubview(productAvailability)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo:  contentView.topAnchor,constant: 15),
            imageView.trailingAnchor.constraint(equalTo:  contentView.trailingAnchor,constant: -20),
            imageView.leadingAnchor.constraint(equalTo:  contentView.leadingAnchor,constant: 20),
            imageView.bottomAnchor.constraint(equalTo:  contentView.bottomAnchor,constant: -80),
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
  
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
