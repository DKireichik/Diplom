//
//  Information.swift
//  Oz.by
//
//  Created by Darya on 22.04.24.
//

import Foundation
import UIKit

var productBasketArray: [ProductItem] = []
var productFavoritesArray: [ProductItem] = []
struct ProductItem: Codable, Hashable {
    var name: String
    var price: Double
    var productAvailability: String
    var image: String
    var type: Shoptype
    var count: Int
}
struct SearchType {
    var name: String
    var image: UIImage
    var type: Shoptype
}
enum Shoptype: String, Codable {
    case books = "Книги"
    case games = "Игры"
    case souvenirs = "Сувениры"
}
struct SearchList {
    static func searchList() -> [SearchType] {
        [
            .init(name: Shoptype.books.rawValue, image: UIImage(systemName: "books.vertical")!, type: .books),
            .init(name: Shoptype.games.rawValue, image: UIImage(systemName: "gamecontroller")!, type: .games),
            .init(name: Shoptype.souvenirs.rawValue, image: UIImage(systemName: "loupe")!, type: .souvenirs)
        ]
    }
}
struct Source {
    static func makeProduct() -> [ProductItem] {
        [
            .init(name: "Томас Маан", price: 10.5, productAvailability: "Есть в наличии", image: "Book", type: .books, count: 1),
            .init(name: "Аллан Гай", price: 17.3, productAvailability: "Есть в наличии", image: "Book1", type: .books, count: 1),
            .init(name: "Уве", price: 13.5, productAvailability: "Нет в наличии", image: "Book2", type: .books, count: 1),
            .init(name: "Титаник", price: 25.6, productAvailability: "Есть в наличии", image: "Book3", type: .books, count: 1),
            .init(name: "Карандаш", price: 1.5, productAvailability: "Есть в наличии", image: "1", type: .souvenirs, count: 1),
            .init(name: "Ваза", price: 15.4, productAvailability: "Есть в наличии", image: "2", type: .souvenirs, count: 1),
            .init(name: "Уно", price: 20.5, productAvailability: "Есть в наличии", image: "game3", type: .games, count: 1),
            .init(name: "Спящие королевы", price: 103.6, productAvailability: "Есть в наличии", image: "game2", type: .games, count: 1),
            .init(name: "Манчикен", price: 12.61, productAvailability: "Есть в наличии", image: "game1", type: .games, count: 1),
            .init(name: "Соображарий", price: 25.5, productAvailability: "Есть в наличии", image: "think", type: .games, count: 1),
            .init(name: "Дубль", price: 5.4, productAvailability: "Есть в наличии", image: "Doubl", type: .games, count: 1),
            .init(name: "Факт или фейк", price: 15.2, productAvailability: "Есть в наличии", image: "Fact", type: .games, count: 1),
            .init(name: "Крокодил", price: 44.7, productAvailability: "Есть в наличии", image: "crocodile", type: .games, count: 1),
            .init(name: "Ангел", price: 18.2, productAvailability: "Есть в наличии", image: "angel", type: .souvenirs, count: 1),
            .init(name: "Мини-Дарт Вейдер", price: 54.3, productAvailability: "Есть в наличии", image: "Dart", type: .souvenirs, count: 1)
        ]
    }
    static func makeProductWithGroup() -> [[ProductItem]] {
        let book = makeProduct().filter { $0.type == .books }
        let games = makeProduct().filter { $0.type == .games }
        let souvenirs = makeProduct().filter { $0.type == .souvenirs }
        return [book, games, souvenirs]
    }
}

let decoder = JSONDecoder()
let encoder = JSONEncoder()
class DataManager {
    private let userDefaults = UserDefaults(suiteName: "basket")
    private let stepKeys = "stepKeys"
    private let userDefaultsFavorites = UserDefaults(suiteName: "favorites")
    private let stepKeysFavorites = "stepFavorites"
    func saveStep ( _ step: [ProductItem] ) {
        do {
            let stepData = try encoder.encode(step)
            userDefaults?.setValue(stepData, forKey: stepKeys)
        } catch {
            print("\(error)")
        }
    }
    func obtainStep() -> [ProductItem] {
        guard let stepData = userDefaults?.data(forKey: stepKeys) else { return [] }
        do {
            let users = try decoder.decode([ProductItem].self, from: stepData)
            return users
        } catch {
            print("\(error)")
        }
        return []
    }
    func saveStepFavorites ( _ step: [ProductItem] ) {
        do {
            let stepData = try encoder.encode(step)
            userDefaultsFavorites?.setValue(stepData, forKey: stepKeysFavorites)
        } catch {
            print("\(error)")
        }
    }
    func obtainStepFavorites() -> [ProductItem] {
        guard let stepData = userDefaultsFavorites?.data(forKey: stepKeysFavorites) else { return [] }
        do {
            let users = try decoder.decode([ProductItem].self, from: stepData)
            return users
        } catch {
            print("\(error)")
        }
        return []
    }
    func deleteStep ( _ step: [ProductItem] ) {
        userDefaults?.removeObject(forKey: stepKeys)
    }
}
