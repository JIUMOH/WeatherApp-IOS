//
//  LoadingVM.swift
//  WeatherApp
//
//  Created by Stanislav Rusakov on 16.02.23.
//

import Foundation

class LoadingVM {
    
    private let weatherManager: WeatherManager
    
    var onWeather: (() -> Void)?
    
    init(weatherManager: WeatherManager) {
        self.weatherManager = weatherManager
        
        if let isRequesting = weatherManager.isRequesting,
         !isRequesting {
            onWeather?()
        } else {
            weatherManager.completion = { [weak self] _ in
                DispatchQueue.main.async {
                    self?.onWeather?()
                }
            }
        }
    }
    
}
