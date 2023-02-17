//
//  AppCoordinator.swift
//  WeatherApp
//
//  Created by Stanislav Rusakov on 16.02.23.
//

import Foundation
import UIKit
import CoreLocation

enum AppChildCoordinator {
    case setup
    case weather
}

final class AppCoordinator: NSObject, Coordinator {
    // MARK: - Properties

    private let window: UIWindow

    private var navigationController: UINavigationController
    private var childCoordinators = [AppChildCoordinator: Coordinator]()
    private var locationManager: CLLocationManager!
    private let weatherManager: WeatherManager
    
    // MARK: - Init

    init(window: UIWindow, navigationController: UINavigationController, weatherManager: WeatherManager) {
        self.window = window
        self.navigationController = navigationController
        self.weatherManager = weatherManager

        self.window.rootViewController = navigationController
    }

    // MARK: - Coordinator

    func start() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
    }

    // MARK: - Private methods

    private func runSetupFlow() {
        let coordinator = SetupCoordinator(navigationController: navigationController,
                                           weatherManager: weatherManager)
        coordinator.finishFlow = { [unowned self] in
            self.childCoordinators[.setup] = nil
            self.navigationController.viewControllers.removeAll()
            self.start()
        }
        childCoordinators[.setup] = coordinator
        coordinator.start()
    }
    
    private func runWeatherFlow() {
        let coordinator = WeatherCoordinator(navigationController: navigationController,
                                             weatherManager: weatherManager)
        coordinator.finishFlow = { [unowned self] in
            self.childCoordinators[.weather] = nil
            self.navigationController.viewControllers.removeAll()
            self.start()
        }
        childCoordinators[.weather] = coordinator
        coordinator.start()
    }
}

extension AppCoordinator: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else {
            return
        }
        
        weatherManager.getCurrentWeather(lat:  locValue.latitude, lon:  locValue.longitude)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
            runWeatherFlow()
        default:
            runSetupFlow()
            locationManager.delegate = nil
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
