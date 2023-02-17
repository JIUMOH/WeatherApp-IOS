//
//  Double+extension.swift
//  WeatherApp
//
//  Created by Stanislav Rusakov on 17.02.23.
//

import Foundation

extension Double {
    func doubleToString() -> String {
        return String(format: "%.0f", self)
    }
}
