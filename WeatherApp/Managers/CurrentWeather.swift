//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Stanislav Rusakov on 16.02.23.
//

import Foundation

class CurrentWeather: Codable {
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let dt: TimeInterval
    let sys: Sys
    let timezone: Int
    let name: String
}

class Coord: Codable {
    let lon, lat: Double
}

class Weather: Codable {
    let id: Int
    let main, description, icon: String
}

class Main: Codable {
    let temp, feels_like, temp_min, temp_max: Double
    let pressure, humidity: Double
}

class Wind: Codable {
    let speed: Double
}

class Sys: Codable {
    let country: String
}
