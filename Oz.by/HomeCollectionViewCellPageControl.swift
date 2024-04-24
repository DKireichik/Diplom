//
//  HomeCollectionViewCellPageControl.swift
//  Oz.by
//
//  Created by Darya on 23.04.24.
//

import Foundation
import UIKit

class HomeCollectionViewCellPageControl: UICollectionViewCell {
    
    static let id = "HomeCollectionPageControl"

    let pageControl = {
        let pageControl =  UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.orange
        return pageControl
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        

        contentView.addSubview(pageControl)

        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pageControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
