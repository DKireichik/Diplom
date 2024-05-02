//
//  PaymentCardView.swift
//  Oz.by
//
//  Created by Darya on 2.05.24.
//

import Foundation
import UIKit

class PaymentCardView : UIView {
    let info = {
        let info = UILabel()
        info.translatesAutoresizingMaskIntoConstraints = false
        info.text = "Для оплаты введите данные карты"
        return info
    }()
    let numberCard  = {
        let number = UITextField()
        number.borderStyle = .bezel
        number.placeholder = "1234 1234 1234 1234"
        number.translatesAutoresizingMaskIntoConstraints = false
        return number
    }()
    let svv  = {
        let svv = UITextField()
        svv.borderStyle = .bezel
        svv.placeholder = "SVV"
        svv.translatesAutoresizingMaskIntoConstraints = false
        return svv
    }()
    let validity  = {
        let validity = UITextField()
        validity.borderStyle = .bezel
        validity.placeholder = "ММ/ГГ"
        validity.translatesAutoresizingMaskIntoConstraints = false
        return validity
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(info)
        addSubview(numberCard)
        addSubview(svv)
        addSubview(validity)
        backgroundColor = .lightGray
        
        NSLayoutConstraint.activate([
            info.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            info.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            info.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            numberCard.topAnchor.constraint(equalTo: info.bottomAnchor, constant: 5),
            numberCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            numberCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            validity.topAnchor.constraint(equalTo: svv.bottomAnchor, constant: 5),
            validity.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            validity.widthAnchor.constraint(equalToConstant: 100),
            svv.topAnchor.constraint(equalTo: numberCard.bottomAnchor, constant: 5),
            svv.leadingAnchor.constraint(equalTo: validity.trailingAnchor, constant: -10),
            svv.widthAnchor.constraint(equalToConstant: 60),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
