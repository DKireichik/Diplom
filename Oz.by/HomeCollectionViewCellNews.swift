//
//  HomeCollectionViewCellFirst.swift
//  Diplom
//
//  Created by Darya on 17.04.24.
//

import UIKit

class HomeCollectionViewCellNews: UICollectionViewCell {
    
    static let id = "HomeCollectionViewCellNews"
    
    let imageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let pageControl = {
        let pageControl =  UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.orange
        return pageControl
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(pageControl)

        NSLayoutConstraint.activate([

            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -25),
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5)
        
        ])
        imageView.contentMode = .scaleAspectFill
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
