//
//  HomeCollectionViewCellFirst.swift
//  Diplom
//
//  Created by Darya on 17.04.24.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    static let id = "NewsCollectionViewCell"
    
    let imageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
