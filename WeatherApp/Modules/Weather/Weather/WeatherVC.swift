//
//  WeatherVC.swift
//  WeatherApp
//
//  Created by Stanislav Rusakov on 16.02.23.
//

import Foundation
import UIKit

class WeatherVC: UIViewController {

    var viewModel : WeatherVM!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblTempMin: UILabel!
    @IBOutlet weak var lblTempMax: UILabel!
    @IBOutlet weak var lblTempFeelsLike: UILabel!
    @IBOutlet weak var lblWeather: UILabel!
    @IBOutlet weak var lblPresure: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }

    func bind() {
        lblCity.text = viewModel.city ?? "N/A"
        lblWeather.text = viewModel.temperture ?? "N/A"
        lblTempMin.text = viewModel.tempMin ?? "N/A"
        lblTempMax.text = viewModel.tempMax ?? "N/A"
        lblTempFeelsLike.text = viewModel.tempFeelsLike ?? "N/A"
        lblWeather.text = viewModel.weather ?? "N/A"
        lblPresure.text = viewModel.presure ?? "N/A"
        lblHumidity.text = viewModel.humidity ?? "N/A"
    }
    
}
