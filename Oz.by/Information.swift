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
    var productAvailability: Bool
    var image : UIImage
    var type : Shoptype
}

enum Shoptype: String {
    case books = "Books"
    case games = "Games"
    case souvenirs = "Souvenirs"
}
