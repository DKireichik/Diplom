//
//  String+Extension.swift
//  Oz.by
//
//  Created by Darya on 3.05.24.
//

import Foundation

extension String {
    enum ValideTypes {
        case name
    }
    enum Regex: String {
        case name = "^[а-яА-ЯЁё]+\\s[а-яА-ЯЁё]+$"
    }
    func isValid (validType: ValideTypes) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        switch validType {
        case.name: regex = Regex.name.rawValue
        }
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}

