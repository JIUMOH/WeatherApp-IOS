//
//  WeatherCoordinator.swift
//  WeatherApp
//
//  Created by Stanislav Rusakov on 16.02.23.
//

import Foundation
import UIKit

final class WeatherCoordinator: Coordinator, CoordinatorFinishOutput {
    // MARK: - CoordinatorFinishOutput

    var finishFlow: (() -> Void)?

    // MARK: - Vars & Lets

    let navigationController: UINavigationController
    let weatherManager: WeatherManager
    let storyboard = UIStoryboard.init(name: "Weather", bundle: .main)
    
    // MARK: - Coordinator

    func start() {
        if let isRequesting = weatherManager.isRequesting,
            !isRequesting {
            showWeatherVC()
        } else {
            showLoadingVC()
        }
    }

    // MARK: - Init

    init(navigationController: UINavigationController, weatherManager: WeatherManager) {
        self.navigationController = navigationController
        self.weatherManager = weatherManager
    }

    // MARK: - Private methods
    
    private func showLoadingVC() {
        let vc = storyboard.instantiateViewController(withIdentifier: "LoadingVC") as! LoadingVC
        vc.viewModel = LoadingVM(weatherManager: weatherManager)

        vc.onWeather = { [unowned self] in
            self.showWeatherVC(animated: false)
        }
        
        navigationController.pushViewController(vc, animated: false)
    }
    
    private func showWeatherVC(animated: Bool = true) {
        let vc = storyboard.instantiateViewController(withIdentifier: "WeatherVC") as! WeatherVC
        vc.viewModel = WeatherVM(weatherManager: weatherManager)

        navigationController.pushViewController(vc, animated: animated)
    }

}

protocol LoadingProtocol: AnyObject {
    var onWeather: (() -> Void)? { get set }
}
