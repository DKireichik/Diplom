//
//  BasketTableFooterView.swift
//  Oz.by
//
//  Created by Darya on 26.04.24.
//

import Foundation
import UIKit

class BasketTableFooterView : UIView {
    let info = {
        let info = UILabel()
        info.font = UIFont.boldSystemFont(ofSize: 16)
        info.textAlignment = .center
        info.translatesAutoresizingMaskIntoConstraints = false
        info.text = "Введите данные для оформления заказа"
        return info
    }()
    let number  = {
        let number = UITextField()
        number.placeholder = "Введите номер телефона"
        number.borderStyle = .roundedRect
        number.translatesAutoresizingMaskIntoConstraints = false
        return number
    }()
    let name  = {
        let name = UITextField()
        name.borderStyle = .roundedRect
        name.placeholder = "Введите имя и фомилию"
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    let sum = {
        let sum = UILabel()
        sum.text = "Итого "
        sum.font = UIFont.boldSystemFont(ofSize: 16)
        sum.textAlignment = .center
        sum.textColor = .white
        sum.backgroundColor = .orange
        sum.translatesAutoresizingMaskIntoConstraints = false
        return sum
    }()
    let adress  = {
        let adress = UITextField()
        adress.placeholder = "Введите адрес доставки"
        adress.borderStyle = .roundedRect
        adress.translatesAutoresizingMaskIntoConstraints = false
        return adress
    }()
    lazy var orderButton = {
        let orderButton = UIButton(type: .system)
        orderButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        orderButton.setTitle("Оформить заказ", for: .normal)
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        orderButton.tintColor = .white
        orderButton.backgroundColor = .orange
        orderButton.addTarget(self, action: #selector(orderBasket), for: .touchUpInside)
        return orderButton
    }()
    var orderBasketButton: (() -> Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(info)
        addSubview(number)
        addSubview(name)
        addSubview(adress)
        addSubview(sum)
        addSubview(orderButton)
        NSLayoutConstraint.activate([
            info.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            info.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            info.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            name.topAnchor.constraint(equalTo: info.bottomAnchor, constant: 10),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            number.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            number.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            number.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            adress.topAnchor.constraint(equalTo: number.bottomAnchor, constant: 10),
            adress.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            adress.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            sum.topAnchor.constraint(equalTo: adress.bottomAnchor, constant: 10),
            sum.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            sum.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            sum.heightAnchor.constraint(equalToConstant: 30),
            orderButton.topAnchor.constraint(equalTo: sum.bottomAnchor, constant: 10),
            orderButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            orderButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            orderButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func orderBasket (_ sender : UIButton) {
        orderBasketButton?()
    }
}
