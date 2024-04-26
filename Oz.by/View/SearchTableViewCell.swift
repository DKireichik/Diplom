//
//  SearchTableViewCell.swift
//  Oz.by
//
//  Created by Darya on 22.04.24.
//

import Foundation
import UIKit

class SearchTableViewCell: UITableViewCell {

    let image = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let labelImage = {
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(image)
        contentView.addSubview(labelImage)
        contentView.addSubview(price)
        contentView.addSubview(productAvailability)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            image.widthAnchor.constraint(equalToConstant: 60),
            image.heightAnchor.constraint(equalToConstant: 90),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            labelImage.topAnchor.constraint(equalTo: image.topAnchor, constant: 8),
            labelImage.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12),
            productAvailability.topAnchor.constraint(equalTo: labelImage.bottomAnchor, constant: 5),
            productAvailability.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12),
            price.topAnchor.constraint(equalTo: productAvailability.bottomAnchor, constant: 5),
            price.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
