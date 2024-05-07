//
//  HomeViewController.swift
//  Diplom
//
//  Created by Darya on 16.04.24.
//

import UIKit

class Preview {
    var headerLabelText: [String] = ["", "", "Истории", "Книги"]
    var discountImage: [UIImage] = [.discont1, .news1, .news2]
    var newsImage: [UIImage] = [.news, .news1, .news2]
}
class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate, UISearchControllerDelegate {
    private let searchController  = UISearchController(searchResultsController: nil)
    let preview = Preview()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: getCompositionalLayout())
    lazy var dataManager = DataManager()
     override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = .init(title: nil, image: .init(systemName: "bell"), target: nil, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = .orange
        navigationItem.titleView = searchController.searchBar
        searchController.searchBar.placeholder = "Введите название товара"
        searchController.searchBar.delegate = self
        searchController.delegate = self
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
        collectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: NewsCollectionViewCell.id)
        collectionView.register(DiscountCollectionViewCell.self, forCellWithReuseIdentifier: DiscountCollectionViewCell.id)
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.id)
        collectionView.register(PageControlCollectionViewCell.self, forCellWithReuseIdentifier: PageControlCollectionViewCell.id)
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
    }
    func getCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, environment) -> NSCollectionLayoutSection? in
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
            return preview.discountImage.count
        case 3:
            return 4
        default:
            fatalError()
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.id, for: indexPath)
            guard let cellNews = cell as? NewsCollectionViewCell else {return cell}
            cellNews.imageView.image = preview.newsImage[indexPath.row]
            return cellNews
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageControlCollectionViewCell.id, for: indexPath)
            guard let cellPageControll = cell as? PageControlCollectionViewCell else {return cell}
            cellPageControll.pageControl.numberOfPages = preview.newsImage.count
            cellPageControll.pageControl.currentPage = indexPath.row
            return cellPageControll
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscountCollectionViewCell.id, for: indexPath)
            guard let cellDiscounts = cell as? DiscountCollectionViewCell else {return cell}
            cellDiscounts.imageView.image = preview.discountImage[indexPath.row]
            return cellDiscounts
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.id, for: indexPath)
            guard let cellBooks = cell as? ProductCollectionViewCell else {return cell}
            cellBooks.imageView.image = UIImage(named: Source.makeProduct()[indexPath.row].image)
            cellBooks.labelImageProduct.text = Source.makeProduct()[indexPath.row].name
            cellBooks.price.text = "\(Source.makeProduct()[indexPath.row].price)"+" руб"
            cellBooks.productAvailability.text = Source.makeProduct()[indexPath.row].productAvailability
            cellBooks.basketButton.tintColor = .orange
            cellBooks.addToBasketButton = { [weak self] in
                productBasketArray.append(Source.makeProduct()[indexPath.row])
                self?.dataManager.saveStep(productBasketArray)
                cellBooks.basketButton.isEnabled = false
            }
            cellBooks.addToFavoritesButton = { [weak self] in
                productFavoritesArray.append(Source.makeProduct()[indexPath.row])
                self?.dataManager.saveStepFavorites(productFavoritesArray)
                cellBooks.favoritesButton.tintColor = .red
            }
            return cellBooks
        default:
            fatalError()
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath)
        guard let header = cell as? HeaderCollectionReusableView else {return cell}
        header.label.text = preview.headerLabelText[indexPath.section]
        return header
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 3 {
            let productVC = ProductViewController()
            let product = Source.makeProduct()[indexPath.row]
            productVC.imageView.image = UIImage(named: product.image)
            productVC.labelImage.text = product.name
            productVC.productAvailability.text = product.productAvailability
            productVC.price.text = "\(product.price)"+" руб"
            productVC.title = product.name
            navigationController?.pushViewController(productVC, animated: false)
        }
    }
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        let searchViewController = SearchViewController()
        navigationController?.pushViewController(searchViewController, animated: false)
        return false
    }
}
