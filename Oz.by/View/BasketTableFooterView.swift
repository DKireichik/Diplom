//
//  BasketTableFooterView.swift
//  Oz.by
//
//  Created by Darya on 26.04.24.
//

import Foundation
import UIKit

class BasketTableFooterView : UIView {
    
    let number  = {
        let number = UITextField()
        number.translatesAutoresizingMaskIntoConstraints = false
        return number
    }()
   let name  = {
       let number = UITextField()
       number.translatesAutoresizingMaskIntoConstraints = false
       return number
   }()
    let sum = {
        let sum = UILabel()
        sum.translatesAutoresizingMaskIntoConstraints = false
        return sum
    }()
    let orderButton = {
        let orderButton = UIButton(type: .system)
        orderButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        orderButton.setTitle("Добавить в корзину", for: .normal)
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        orderButton.tintColor = .white
        orderButton.backgroundColor = .orange
        orderButton.addTarget(BasketTableFooterView.self, action: #selector(orderBasket), for: .touchUpInside)
        return orderButton
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(number)
        addSubview(name)
        addSubview(sum)
        addSubview(orderButton)

        
        NSLayoutConstraint.activate([
            
        ])

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func orderBasket (_ sender : UIButton) {
       
    }
}
