//
//  WeatherVM.swift
//  WeatherApp
//
//  Created by Stanislav Rusakov on 16.02.23.
//

import Foundation

class WeatherVM {
    
    private let weatherManager: WeatherManager
    
    var city: String!
    var temperture: String!
    var tempMin: String!
    var tempMax: String!
    var tempFeelsLike: String!
    var weather: String!
    var presure: String!
    var humidity: String!
    
    init(weatherManager: WeatherManager) {
        self.weatherManager = weatherManager
        
        if let currentWeather = weatherManager.currentWeather  {
            city = currentWeather.name
            temperture = "\(currentWeather.main.temp.doubleToString())°"
            tempMin = "\(currentWeather.main.temp_min.doubleToString())°"
            tempMax = "\(currentWeather.main.temp_max.doubleToString())°"
            tempFeelsLike = "\(currentWeather.main.feels_like.doubleToString())°"
            if let weather = currentWeather.weather.first {
                self.weather = weather.main
            }
            presure = "\(currentWeather.main.pressure.doubleToString())mm"
            humidity = "\(currentWeather.main.humidity.doubleToString())%"
        }
    }
    
}
