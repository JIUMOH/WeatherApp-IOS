//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Stanislav Rusakov on 16.02.23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator : AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.init(named: "background")
        
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
        let weatherManager = WeatherManager()
        
        appCoordinator = AppCoordinator(window: window!,
                                        navigationController: navigationController,
                                        weatherManager: weatherManager)
        appCoordinator!.start()
        
        window!.makeKeyAndVisible()
        
        return true
    }

}

