//
//  IntroVC.swift
//  WeatherApp
//
//  Created by Stanislav Rusakov on 16.02.23.
//

import Foundation
import UIKit

class IntroductionVC : UIViewController, IntroductionProtocol {
    
    var viewModel : IntroductionVM!
    
    // MARK: - IntroductionProtocol

    var onTutorial: (() -> Void)?
    
    @IBOutlet weak var btnPermission: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnOpenSettings: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }

    func bind() {
        viewModel.onAuth = { [unowned self] in
            self.showNextBtn()
        }
        viewModel.onDenied = { [unowned self] in
            self.showOpenSettingsBtn()
        }
    }
    
    func showNextBtn() {
        UIView.animate(withDuration: 1, animations: {
            self.btnNext.alpha = 1
            self.btnOpenSettings.alpha = 0
        })
    }
    
    
    func showOpenSettingsBtn() {
        UIView.animate(withDuration: 1, animations: {
            self.btnOpenSettings.alpha = 1
        })
    }
    
    @IBAction func permissionBtnTapped(_ sender: Any) {
        UIView.animate(withDuration: 1, animations: {
            self.btnPermission.alpha = 0
        })
        viewModel.requestPermissons()
    }
    
    @IBAction func nextBtnTapped(_ sender: Any) {
        onTutorial?()
    }
    
    @IBAction func openSettingsBtnTapped(_ sender: Any) {
        viewModel.openSettings()
    }
    
}

