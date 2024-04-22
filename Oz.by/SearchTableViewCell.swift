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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelImage = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(image)
        contentView.addSubview(labelImage)
        
        NSLayoutConstraint.activate([

            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            labelImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            labelImage.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12),
        ])
       
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
    
