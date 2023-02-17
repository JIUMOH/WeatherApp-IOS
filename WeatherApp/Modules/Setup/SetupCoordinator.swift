//
//  TutorialCoordinator.swift
//  WeatherApp
//
//  Created by Stanislav Rusakov on 16.02.23.
//

import Foundation
import UIKit


final class SetupCoordinator: Coordinator, CoordinatorFinishOutput {
    // MARK: - CoordinatorFinishOutput

    var finishFlow: (() -> Void)?

    // MARK: - Vars & Lets

    let navigationController: UINavigationController
    let weatherManager: WeatherManager
    let storyboard = UIStoryboard.init(name: "Setup", bundle: .main)
    
    // MARK: - Coordinator

    func start() {
        showSetupVC()
    }

    // MARK: - Init

    init(navigationController: UINavigationController, weatherManager: WeatherManager) {
        self.navigationController = navigationController
        self.weatherManager = weatherManager
    }

    // MARK: - Private methods
    
    private func showSetupVC() {
        let vc = storyboard.instantiateViewController(withIdentifier: "IntroductionVC") as! IntroductionVC
        vc.viewModel = IntroductionVM(weatherManager: weatherManager)
        
        vc.onTutorial = { [unowned self] in
            self.showTutorialVC()
        }

        navigationController.pushViewController(vc, animated: true)
    }
    
    private func showTutorialVC() {
        let vc = storyboard.instantiateViewController(withIdentifier: "TutorialVC") as! TutorialVC
        vc.viewModel = TutorialVM()

        vc.onSuccess = { [unowned self] in
            self.navigationController.dismiss(animated: true, completion: nil)
            self.finishFlow?()
        }

        navigationController.pushViewController(vc, animated: true)
    }

}

protocol IntroductionProtocol: AnyObject {
    var onTutorial: (() -> Void)? { get set }
}

protocol TutorialProtocol: AnyObject {
    var onSuccess: (() -> Void)? { get set }
}
