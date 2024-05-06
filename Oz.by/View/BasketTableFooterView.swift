//
//  BasketTableFooterView.swift
//  Oz.by
//
//  Created by Darya on 26.04.24.
//

import Foundation
import UIKit

class BasketTableFooterView: UIView {
    let info = {
        let info = UILabel()
        info.font = UIFont.boldSystemFont(ofSize: 16)
        info.textAlignment = .center
        info.translatesAutoresizingMaskIntoConstraints = false
        info.text = "Введите данные для оформления заказа"
        return info
    }()
    let numberPhone  = {
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
    let address  = {
        let address = UITextField()
        address.placeholder = "Введите адрес доставки"
        address.borderStyle = .roundedRect
        address.translatesAutoresizingMaskIntoConstraints = false
        return address
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
    let nameValidType: String.ValideTypes = .name
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(info)
        addSubview(numberPhone)
        addSubview(name)
        addSubview(address)
        addSubview(sum)
        addSubview(orderButton)
        name.delegate = self
        numberPhone.delegate = self
        numberPhone.keyboardType = .numberPad
        NSLayoutConstraint.activate([
            info.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            info.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            info.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            name.topAnchor.constraint(equalTo: info.bottomAnchor, constant: 10),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            numberPhone.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            numberPhone.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            numberPhone.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            address.topAnchor.constraint(equalTo: numberPhone.bottomAnchor, constant: 10),
            address.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            address.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            sum.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 10),
            sum.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            sum.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            sum.heightAnchor.constraint(equalToConstant: 30),
            orderButton.topAnchor.constraint(equalTo: sum.bottomAnchor, constant: 10),
            orderButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            orderButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            orderButton.heightAnchor.constraint(equalToConstant: 50),
            orderButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func orderBasket (_ sender: UIButton) {
        orderBasketButton?()
    }
    private func setTextField(textField: UITextField, validType: String.ValideTypes, string: String, range: NSRange) {
        let text = (textField.text ?? "") + string
        let result: String
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            result = String(text[text.startIndex..<end])
        } else {
            result = text
        }
        textField.text = result
        if result.isValid(validType: validType) {
            name.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        } else {
            name.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
    }
    private func setPhoneNumberMask(textField: UITextField, mask: String, string: String, range: NSRange) -> String {
        let text = textField.text ?? ""
        let phone = (text as NSString).replacingCharacters(in: range, with: string)
        let number = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = number.startIndex
        for character in mask where index < number.endIndex {
            if character == "X" {
                result.append(number[index])
                index = number.index(after: index)
            } else {
                result.append(character)
            }
        }
        return result
    }
}
extension BasketTableFooterView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case name:
            setTextField(textField: name, validType: nameValidType, string: string, range: range)
        case numberPhone:
            numberPhone.text = setPhoneNumberMask(textField: numberPhone, mask: "+XXX (XX) XXX-XX-XX",
                                                                          string: string,
                                                                          range: range)
        default:
            break
        }
        return false
    }
}
