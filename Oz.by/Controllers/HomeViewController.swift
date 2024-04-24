//
//  HomeViewController.swift
//  Diplom
//
//  Created by Darya on 16.04.24.
//

import UIKit

class Preview {
    var headerLabelText: [String] = ["","","Истории","Книги"]
    var discontImage: [UIImage] = [.news,.news,.news,.news,]
    var newsImage: [UIImage] = [.news,.news,.news,]
}
let storeGoods = SearchViewController()
private let searchController  = UISearchController(searchResultsController: storeGoods)

class HomeViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource{
   
    let preview = Preview()
    lazy var collectionView = UICollectionView (frame: .zero,
                                                collectionViewLayout: getCompositionalLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = .init(title: nil, image: .init(systemName: "bell"), target: nil, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = .orange
        navigationItem.titleView = searchController.searchBar
        searchController.searchBar.placeholder = "Введите название товара"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = false
        navigationItem.hidesSearchBarWhenScrolling = false
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
            
        ])
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(HomeCollectionViewCellNews.self, forCellWithReuseIdentifier: HomeCollectionViewCellNews.id)
        collectionView.register(HomeCollectionViewCellDiscounts.self, forCellWithReuseIdentifier: HomeCollectionViewCellDiscounts.id)
        collectionView.register(HomeCollectionViewCellBooks.self, forCellWithReuseIdentifier: HomeCollectionViewCellBooks.id)
        collectionView.register(HomeCollectionViewCellPageControl.self, forCellWithReuseIdentifier: HomeCollectionViewCellPageControl.id)
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        
        
    }
    
    
    func getCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, evironment) -> NSCollectionLayoutSection? in
            switch section {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .fractionalHeight(1/3))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let layoutSection = NSCollectionLayoutSection(group: group)
                layoutSection.orthogonalScrollingBehavior = .continuous
                return layoutSection
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .fractionalHeight(1/15))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let layoutSection = NSCollectionLayoutSection(group: group)
                layoutSection.orthogonalScrollingBehavior = .continuous
                return layoutSection
            case 2:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3),
                                                      heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .fractionalHeight(1/4))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.interItemSpacing = .fixed(8)
                let layoutSection = NSCollectionLayoutSection(group: group)
                layoutSection.interGroupSpacing = 8
                layoutSection.contentInsets = .init(top: 10, leading: 12, bottom: 10, trailing: 12)
                layoutSection.orthogonalScrollingBehavior = .continuous
                let headerSection = self.createSectionHeader()
                layoutSection.boundarySupplementaryItems = [headerSection]
                return layoutSection
            case 3:
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
                let headerSection = self.createSectionHeader()
                layoutSection.boundarySupplementaryItems = [headerSection]
                return layoutSection
            default:
                fatalError()
            }
            
        }
    }
    func createSectionHeader () -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return layoutSectionHeader
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return preview.newsImage.count
        case 1:
            return 1
        case 2:
            return preview.discontImage.count
        case 3:
            return 4
        default:
            fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cellNews = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCellNews.id, for: indexPath) as! HomeCollectionViewCellNews
            cellNews.imageView.image = preview.newsImage[indexPath.row]
            return cellNews
        case 1:
            let cellNews = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCellPageControl.id, for: indexPath) as! HomeCollectionViewCellPageControl
            cellNews.pageControl.numberOfPages = preview.newsImage.count
            cellNews.pageControl.currentPage = indexPath.row
            return cellNews
        case 2:
            let cellDiscounts = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCellDiscounts.id, for: indexPath) as! HomeCollectionViewCellDiscounts
            cellDiscounts.imageView.image = preview.discontImage[indexPath.row]
            return cellDiscounts
        case 3:
            let cellBooks = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCellBooks.id, for: indexPath) as! HomeCollectionViewCellBooks
            cellBooks.imageView.image = Source.makeProduct()[indexPath.row].image
            cellBooks.labelImage.text = Source.makeProduct()[indexPath.row].name
            cellBooks.price.text = "\(Source.makeProduct()[indexPath.row].price)"+" руб"
            cellBooks.productAvailability.text = Source.makeProduct()[indexPath.row].productAvailability
            cellBooks.basketButton.tintColor = .orange
            return cellBooks
        default:
            fatalError()
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as!HeaderCollectionReusableView
        header.label.text = preview.headerLabelText[indexPath.section]
        return header
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productVC = ProductViewController()
        let product = Source.makeProduct()[indexPath.row]
        productVC.imageView.image = product.image
        productVC.labelImage.text = product.name
        productVC.productAvailability.text = product.productAvailability
        productVC.price.text = "\(product.price)"+" руб"
        productVC.title = product.name
        navigationController?.pushViewController(productVC, animated: true)
    }
}
