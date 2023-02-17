//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Stanislav Rusakov on 16.02.23.
//

import Foundation

enum NetworkError: Error {
    case serverError
    case decodingError
}

class WeatherManager {
    private let key = "189ea1103af91d7fcd9e2e5591e0dabe"
    
    var currentWeather: CurrentWeather!
    var isRequesting: Bool!
    var completion: ((Result<CurrentWeather, NetworkError>) -> Void)?
    
    func getCurrentWeather(lat : Double, lon : Double) {
        let locale = Locale.current.language.languageCode!.identifier
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&lang=\(locale)&units=metric&appid=\(key)") else {
            completion?(.failure(.serverError))
            return
        }
        
        isRequesting = true
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            defer {
                self.isRequesting = false
            }
            guard let data = data, error == nil else {
                self.completion?(.failure(.serverError))
                return
            }
            do {
                let weather = try JSONDecoder().decode(CurrentWeather.self, from: data)
                self.currentWeather = weather
                self.completion?(.success(weather))
            } catch {
                self.completion?(.failure(.decodingError))
            }
        }.resume()
        
    }
    
}
