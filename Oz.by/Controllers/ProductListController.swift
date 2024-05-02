//
//  ProductCollectionViewController.swift
//  Oz.by
//
//  Created by Darya on 24.04.24.
//

import UIKit

class ProductListController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    lazy var collectionView = UICollectionView (frame: .zero,
                                                collectionViewLayout: getCompositionalLayout())
    var productList : [ProductItem] = []
    lazy var dataManager = DataManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.leadingAnchor)
        ])
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.id)
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
        return productList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellProduct = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.id, for: indexPath) as! ProductCollectionViewCell
        cellProduct.imageView.image = UIImage(named: productList[indexPath.row].image)
        cellProduct.labelImageProduct.text = productList[indexPath.row].name
        cellProduct.price.text = "\(productList[indexPath.row].price)"+" руб"
        cellProduct.productAvailability.text = productList[indexPath.row].productAvailability
        cellProduct.basketButton.tintColor = .orange
        cellProduct.addToBasketButton = { [self] in
            productBasket.append(productList[indexPath.row])
            dataManager.saveStep(productBasket)
            cellProduct.basketButton.isEnabled = false
        }
        return cellProduct
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productVC = ProductViewController()
        let product = productList[indexPath.row]
        productVC.imageView.image = UIImage(named: product.image)
        productVC.labelImage.text = product.name
        productVC.productAvailability.text = product.productAvailability
        productVC.price.text = "\(product.price)"+" руб"
        productVC.title = product.name
        navigationController?.pushViewController(productVC, animated: true)
    }
}


