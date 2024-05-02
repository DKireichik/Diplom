//
//  Information.swift
//  Oz.by
//
//  Created by Darya on 22.04.24.
//

import Foundation
import UIKit

var productBasket : [ProductItem] = []
struct ProductItem: Codable {
    var name: String
    var price: Double
    var productAvailability: String
    var image : String
    var type : Shoptype
}
struct SearchType  {
    var name: String
    var image : UIImage
    var type : Shoptype
}
enum Shoptype: String, Codable {
    case books = "Книги"
    case games = "Игры"
    case souvenirs = "Сувениры"
}
struct SearchList{
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
            .init(name: "Томас Маан", price: 10.5, productAvailability: "Есть в наличии", image: "Book", type: .books),
            .init(name: "Аллан Гай", price: 17.3, productAvailability: "Есть в наличии", image: "Book1", type: .books),
            .init(name: "Уве", price: 13.9, productAvailability: "Нет в наличии", image: "Book2", type: .books),
            .init(name: "Титаник", price: 25.6, productAvailability: "Есть в наличии", image: "Book3", type: .books),
            .init(name: "Карандаш", price: 1.9, productAvailability: "Есть в наличии", image: "1", type: .souvenirs),
            .init(name: "Ваза", price: 15.4, productAvailability: "Есть в наличии", image: "2", type: .souvenirs),
            .init(name: "Уно", price: 20.5, productAvailability: "Есть в наличии", image: "game3", type: .games),
            .init(name: "Спящие королевы", price: 103.6, productAvailability: "Есть в наличии", image: "game2", type: .games),
            .init(name: "Манчикен", price: 12.61, productAvailability: "Есть в наличии", image: "game1", type: .games)
        ]
    }
    static func MakeProductWithGroup() -> [[ProductItem]] {
        let book = makeProduct().filter { $0.type == .books }
        let games = makeProduct().filter { $0.type == .games }
        let souvenirs = makeProduct().filter { $0.type == .souvenirs }
        return [book,games,souvenirs]
    }
}

let decoder = JSONDecoder()
let encoder = JSONEncoder()
class DataManager {
    private let userDefaults = UserDefaults(suiteName: "basket")
    private let stepKeys = "stepKeys"
 
    func saveStep ( _ step: [ProductItem] ) {
        do {
            let stepData = try encoder.encode(step)
            userDefaults?.setValue(stepData, forKey: stepKeys)
        }
        catch {
            print ("\(error)")
        }
    }
    func obtainStep() -> [ProductItem] {
        guard let stepData = userDefaults?.data(forKey: stepKeys) else { return [] }
        do {
            let users = try decoder.decode([ProductItem].self, from: stepData)
            return users
        }
        catch {
            print ("\(error)")
        }
        return []
    }
    func deleteStep ( _ step: [ProductItem] ) {
        userDefaults?.removeObject(forKey: stepKeys)
    }
}

