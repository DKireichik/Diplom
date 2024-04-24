//
//  Information.swift
//  Oz.by
//
//  Created by Darya on 22.04.24.
//

import Foundation
import UIKit

struct Product {
    var name: String
    var price: Double
    var productAvailability: String
    var image : UIImage
    var type : Shoptype
}

enum Shoptype: String {
    case books = "Книги"
    case games = "Игры"
    case souvenirs = "Сувениры"
}

struct Source {
    static func makeProduct() -> [Product] {
        [
            .init(name: "Томас Маан", price: 10.5, productAvailability: "Есть в наличии", image: .book, type: .books),
            .init(name: "Аллан Гай", price: 17.3, productAvailability: "Есть в наличии", image: .book, type: .books),
            .init(name: "Уве", price: 13.9, productAvailability: "Нет в наличии", image: .book, type: .books),
            .init(name: "Титаник", price: 25.6, productAvailability: "Есть в наличии", image: .book, type: .books),
            .init(name: "Карандаш", price: 1.9, productAvailability: "Есть в наличии", image: .book, type: .souvenirs),
            .init(name: "Ваза", price: 15.4, productAvailability: "Есть в наличии", image: .book, type: .souvenirs),
            .init(name: "Уно", price: 20.5, productAvailability: "Есть в наличии", image: .book, type: .games),
            .init(name: "Бункер", price: 103.6, productAvailability: "Есть в наличии", image: .book, type: .games),
            .init(name: "Где мой кот", price: 12.61, productAvailability: "Есть в наличии", image: .book, type: .games)
        ]
    }
}
