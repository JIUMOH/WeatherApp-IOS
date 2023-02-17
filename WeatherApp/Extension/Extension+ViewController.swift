//
//  Extension+ViewController.swift
//  WeatherApp
//
//  Created by Stanislav Rusakov on 16.02.23.
//

import Foundation
import UIKit

extension UIViewController {
    public func pushVC(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }

    public func popVC() {
        _ = navigationController?.popViewController(animated: true)
    }

    public func popToRootVC() {
        _ = navigationController?.popToRootViewController(animated: true)
    }

    public func presentVC(_ vc: UIViewController) {
        present(vc, animated: true, completion: nil)
    }
}
