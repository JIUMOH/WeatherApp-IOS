//
//  IntroViewModel.swift
//  WeatherApp
//
//  Created by Stanislav Rusakov on 16.02.23.
//

import Foundation
import UIKit
import CoreLocation

class IntroductionVM: NSObject {
    
    private let weatherManager: WeatherManager
    private let locationManager = CLLocationManager()
    
    var onAuth: (() -> Void)?
    var onDenied: (() -> Void)?
    
    init(weatherManager: WeatherManager) {
        self.weatherManager = weatherManager
    }
    
    func requestPermissons() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func openSettings() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
    }
}

extension IntroductionVM: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        
        weatherManager.getCurrentWeather(lat:  locValue.latitude, lon:  locValue.longitude)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            onAuth?()
        case .denied, .restricted:
            onDenied?()
        default:
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
