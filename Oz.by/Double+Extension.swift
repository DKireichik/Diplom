//
//  Double+Extension.swift
//  Oz.by
//
//  Created by Darya on 7.05.24.
//

import Foundation

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
