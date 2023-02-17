//
//  LoadingVC.swift
//  WeatherApp
//
//  Created by Stanislav Rusakov on 16.02.23.
//

import Foundation
import UIKit

class LoadingVC: UIViewController, LoadingProtocol {

    var viewModel : LoadingVM!

    // MARK: - LoadingProtocol

    var onWeather: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    func bind() {
        viewModel.onWeather = onWeather
    }

    
}
