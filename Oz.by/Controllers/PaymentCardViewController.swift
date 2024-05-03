//
//  PaymentCardView.swift
//  Oz.by
//
//  Created by Darya on 2.05.24.
//

import Foundation
import UIKit

class PaymentCardViewController : UIViewController {
    let info = {
        let info = UILabel()
        info.translatesAutoresizingMaskIntoConstraints = false
        info.text = "Для оплаты введите данные карты"
        info.font = UIFont.boldSystemFont(ofSize: 20)
        info.textAlignment = .center
        return info
    }()
    let numberCard  = {
        let number = UITextField()
        number.borderStyle = .roundedRect
        number.placeholder = "1234 1234 1234 1234"
        number.translatesAutoresizingMaskIntoConstraints = false
        return number
    }()
    let svv  = {
        let svv = UITextField()
        svv.borderStyle = .roundedRect
        svv.placeholder = "SVV"
        svv.translatesAutoresizingMaskIntoConstraints = false
        return svv
    }()
    let validity  = {
        let validity = UITextField()
        validity.borderStyle = .roundedRect
        validity.placeholder = "ММ/ГГ"
        validity.translatesAutoresizingMaskIntoConstraints = false
        return validity
    }()
    lazy var payButton = {
        let orderButton = UIButton(type: .system)
        orderButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        orderButton.setTitle("Оплатить", for: .normal)
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        orderButton.tintColor = .white
        orderButton.backgroundColor = .orange
        orderButton.titleLabel?.textAlignment = .center
        orderButton.addTarget(self, action: #selector(pay), for: .touchUpInside)
        return orderButton
    }()
    let order = {
        let order = UILabel()
        order.translatesAutoresizingMaskIntoConstraints = false
        order.text = "Ваш заказа №"+"\(Int.random(in: 11...35))"+" оплачен, для уточнения даты и времени доставки с вами свяжется наш спецалист"
        order.font = UIFont.boldSystemFont(ofSize: 26)
        order.numberOfLines = 0
        order.lineBreakMode = .byWordWrapping
        order.textAlignment = .center
        order.isHidden = true
        return order
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(info)
        view.addSubview(numberCard)
        view.addSubview(svv)
        view.addSubview(validity)
        view.addSubview(payButton)
        view.addSubview(order)
        numberCard.delegate = self
        numberCard.keyboardType = .numberPad
        svv.delegate = self
        svv.keyboardType = .numberPad
        validity.delegate = self
        validity.keyboardType = .numberPad
        NSLayoutConstraint.activate([
            info.topAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.topAnchor, constant: 40),
            info.leadingAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            info.trailingAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            numberCard.topAnchor.constraint(equalTo: info.bottomAnchor, constant: 15),
            numberCard.leadingAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            numberCard.trailingAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            validity.topAnchor.constraint(equalTo: numberCard.bottomAnchor, constant: 10),
            validity.leadingAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            validity.widthAnchor.constraint(equalToConstant: 100),
            svv.topAnchor.constraint(equalTo: numberCard.bottomAnchor, constant: 10),
            svv.leadingAnchor.constraint(equalTo: validity.trailingAnchor, constant: 10),
            svv.widthAnchor.constraint(equalToConstant: 60),
            payButton.topAnchor.constraint(equalTo: validity.bottomAnchor, constant: 15),
            payButton.leadingAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            payButton.trailingAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            order.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            order.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            order.leadingAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            order.trailingAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
        
    }
    @objc func pay (_ sender : UIButton) {
        order.isHidden = false
        info.isHidden = true
        numberCard.isHidden = true
        svv.isHidden = true
        validity.isHidden = true
        payButton.isHidden = true
    }
    private func setNumberMask(textField: UITextField, mask: String, string : String, range: NSRange) -> String {
        let text = textField.text ?? ""
        print(text)
        let card = (text as NSString).replacingCharacters(in: range, with: string)
        let number = card.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
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
extension  PaymentCardViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case numberCard :
            numberCard.text = setNumberMask(textField: numberCard, mask: "XXXX XXXX XXXX XXXX",
                                                                          string: string,
                                                                          range: range)
        case validity:
            validity.text = setNumberMask(textField: validity, mask: "XX/XX",string: string,
                                                                                  range: range)
        case svv:
            svv.text = setNumberMask(textField: svv, mask: "XXX", string: string, range: range)
        default:
            break
        }
        return false
    }
}
