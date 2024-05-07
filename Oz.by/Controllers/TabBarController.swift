//
//  TabBarController.swift
//  Diplom
//
//  Created by Darya on 16.04.24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        tabBar.tintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.barTintColor = .clear
        setupTabBar()
    }
   func setupTabBar() {
       let homeViewController = createNavigationController(viewController: HomeViewController(), itemName: "Главная", itemImage: UIImage(systemName: "house")!)
        let searchViewController = createNavigationController(viewController: SearchViewController(), itemName: "Поиск", itemImage: UIImage(systemName: "magnifyingglass")!)
        let basketViewController = createNavigationController(viewController: BasketViewController(), itemName: "Корзина", itemImage: UIImage(systemName: "cart")!)
        let favoritesViewController = createNavigationController(viewController: FavoritesViewController(), itemName: "Избранное", itemImage: UIImage(systemName: "seal")!)
        viewControllers = [homeViewController, searchViewController, basketViewController, favoritesViewController]
        selectedViewController = homeViewController
    }
    private func createNavigationController(viewController: UIViewController, itemName: String, itemImage: UIImage) -> UINavigationController {
        let item = UITabBarItem(title: itemName, image: itemImage.withAlignmentRectInsets(.init(top: 15, left: 0, bottom: 0, right: 0)), tag: 0)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = item
        return navigationController
    }
}
