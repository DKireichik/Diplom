//
//  HomeCollectionViewCell.swift
//  Diplom
//
//  Created by Darya on 16.04.24.
//

import UIKit

class HomeCollectionViewCellDiscounts: UICollectionViewCell {
    
    static let id = "HomeCollectionViewCellDiscounts"
    
    let imageView = {
        let imageView = UIImageView()
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
       
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
     
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
