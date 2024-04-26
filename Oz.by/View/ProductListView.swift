//
//  ProductListView.swift
//  Oz.by
//
//  Created by Darya on 25.04.24.
//

import UIKit

class ProductListView: UIView,UICollectionViewDelegate,UICollectionViewDataSource {
    lazy var collectionView = UICollectionView (frame: .zero,
                                                collectionViewLayout: getCompositionalLayout())
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
        ])
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCellProduct.self, forCellWithReuseIdentifier: CollectionViewCellProduct.id)
    }
    func getCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, evironment) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2),
                                                  heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .fractionalHeight(1/2))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.interItemSpacing = .fixed(8)
            let layoutSection = NSCollectionLayoutSection(group: group)
            layoutSection.interGroupSpacing = 8
            layoutSection.contentInsets = .init(top: 10, leading: 12, bottom: 10, trailing: 12)
            return layoutSection
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellProduct = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellProduct.id, for: indexPath) as! CollectionViewCellProduct
        cellProduct.basketButton.tintColor = .orange
        return cellProduct
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productVC = ProductViewController()
        let product = Source.makeProduct()[indexPath.row]
        productVC.produtView.imageView.image = product.image
        productVC.produtView.labelImage.text = product.name
        productVC.produtView.productAvailability.text = product.productAvailability
        productVC.produtView.price.text = "\(product.price)"+" руб"
        productVC.title = product.name
        productVC.present(productVC, animated: true)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    }


